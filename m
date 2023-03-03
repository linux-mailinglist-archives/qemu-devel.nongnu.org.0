Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040826A995F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6M2-0004xb-EF; Fri, 03 Mar 2023 09:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY6Lz-0004wi-Ry
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:25:47 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY6Lw-00060Y-1W
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:25:47 -0500
Received: by mail-pf1-x430.google.com with SMTP id z11so1659385pfh.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 06:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677853535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wreAfFH2n1KmfuYHmZW0lu1AFMuh49zlqxQjUTSrbL4=;
 b=pb5l3OBJ4/VrxZuYj5sdgTGscya20VlIbl3uhfXBO3PFUDLNuz2pkNio4LA/G89UrP
 mqBo9XI7DnG4/4hpcy6wL7hFDameeM1anJKn8TCIqrVvPj0bfTVfariCWdWwL+PWIaZf
 e9P0mOD1QcZcO+HTKPZNcBc/emzSVHTxUCBBXYshcWfLxIh+Nmnyxm28Cmxutnyu+ecZ
 KznupPRW1y37O00kjEFWgvdNeCmZ2+ca0TsnCcfpsZjSva68p6m3absYOBVrAdTjfFop
 m0bQLz7QJCvHtYkqcJm6PCNtBM0dVoOpPV9i2XSdwzUyBDqqvkBPO63RGCcbNHVZyaKY
 CWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677853535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wreAfFH2n1KmfuYHmZW0lu1AFMuh49zlqxQjUTSrbL4=;
 b=u589RgQ+BaXF3K55g21bZSIkv4qe5qUV5LZYyOFkijHkX4JNcWVFxWYssHDUlt5B35
 qkJqEPM6FMRe+VnOY8Z4X4PFe3WOrAkqLnpePF2LXOFoUsggcJEC80w/uOd1mQ2VKC28
 jXeTp3s8vBCC8IWPJ73EuVFhGDSTYIxQJ+k9Kl66mpFamfXE+S4Do5Sp9noVORA6zM4r
 BmbTNbOCztVCUmqtM72xTbC5HGMPl6Q6d2ByrcejpPvMg/KdN+vWWwsM62BT9Ag2qbZI
 b/iC/hy6rUjyBhBw4qlXDcfugbWO1BeUbDTw0uUZekZj3V4mylUutz0Ma3GdvVlKceVE
 er/Q==
X-Gm-Message-State: AO0yUKUECuAXOnjTmS+oVaCggENnrprOq/t3Fy3Zj13+REJECmI1Ungy
 KjvXlPHU1j11J8CCyeAs1zNKP0r0UMT7Nu1ujKFNZA==
X-Google-Smtp-Source: AK7set+aFBMdAQ1d//x474Hx4EVA9ORGWoauSD+kgab8MPzWbHq0jpAVJIYDK2LG8vFS1oINcOSLiPEJG51muaMrasc=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr555119pgf.9.1677853534929; 
 Fri, 03 Mar 2023 06:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20230223105308.559632-1-ardb@kernel.org>
In-Reply-To: <20230223105308.559632-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:25:23 +0000
Message-ID: <CAFEAcA8Nd+Eq8iGGSLgzoOAXB_GoumETKZMnSEz6cBa7ZOfSWw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw: arm: Support direct boot for Linux/arm64 EFI
 zboot images
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 10:53, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
> format, using gzip compression for the payload.
>
> For doing EFI boot in QEMU, this is completely transparent, as the
> firmware or bootloader will take care of this. However, for direct
> kernel boot without firmware, we will lose the ability to boot such
> distro kernels unless we deal with the new format directly.
>
> EFI zboot images contain metadata in the header regarding the placement
> of the compressed payload inside the image, and the type of compression
> used. This means we can wire up the existing gzip support without too
> much hassle, by parsing the header and grabbing the payload from inside
> the loaded zboot image.

Seems reasonable to me. Any particular reason for marking the
patch RFC ?

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  hw/arm/boot.c       |  4 ++
>  hw/core/loader.c    | 64 ++++++++++++++++++++
>  include/hw/loader.h |  2 +
>  3 files changed, 70 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 3d7d11f782feb5da..dc10a0788227443e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -924,6 +924,10 @@ static uint64_t load_aarch64_image(const char *filen=
ame, hwaddr mem_base,
>          size =3D len;
>      }
>
> +    if (unpack_efi_zboot_image(&buffer, &size)) {
> +        return -1;
> +    }

It seems a bit odd that we will now accept a gzipped file, unzip
it and then look inside it for the EFI zboot image that tells us
to do a second unzip step. Is that intentional/useful?
If not, probably better to do something like "if this is an
EFI zboot image, load-and-decompress, otherwise if a plain gzipped
file, load-and-decompress, otherwise assume a raw file".

> +
>      /* check the arm64 magic header value -- very old kernels may not ha=
ve it */
>      if (size > ARM64_MAGIC_OFFSET + 4 &&
>          memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) =3D=3D 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 173f8f67f6e3e79c..7e7f49261a309012 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -857,6 +857,70 @@ ssize_t load_image_gzipped(const char *filename, hwa=
ddr addr, uint64_t max_sz)
>      return bytes;
>  }

I assume there's a spec somewhere that defines the file format;
this would be a good place for a comment giving a reference to it
(URL, document name, etc).

> +// The Linux header magic number for a EFI PE/COFF
> +// image targetting an unspecified architecture.
> +#define LINUX_EFI_PE_MAGIC        "\xcd\x23\x82\x81"
> +
> +struct linux_efi_zboot_header {
> +    uint8_t     msdos_magic[4];         // PE/COFF 'MZ' magic number
> +    uint8_t     zimg[4];                // "zimg" for Linux EFI zboot im=
ages
> +    uint32_t    payload_offset;         // LE offset to the compressed p=
ayload
> +    uint32_t    payload_size;           // LE size of the compressed pay=
load
> +    uint8_t     reserved[8];
> +    char        compression_type[32];   // Compression type, e.g., "gzip=
"
> +    uint8_t     linux_magic[4];         // Linux header magic
> +    uint32_t    pe_header_offset;       // LE offset to the PE header
> +};

QEMU coding standard doesn't use '//' style comments.

> +
> +/*
> + * Check whether *buffer points to a Linux EFI zboot image in memory.
> + *
> + * If it does, attempt to decompress it to a new buffer, and free the ol=
d one.
> + * If any of this fails, return an error to the caller.
> + *
> + * If the image is not a Linux EFI zboot image, do nothing and return su=
ccess.
> + */
> +int unpack_efi_zboot_image(uint8_t **buffer, int *size)
> +{
> +    const struct linux_efi_zboot_header *header;
> +    uint8_t *data =3D NULL;
> +    ssize_t bytes;
> +
> +    /* ignore if this is too small to be a EFI zboot image */
> +    if (*size < sizeof(*header)) {
> +        return 0;
> +    }
> +
> +    header =3D (struct linux_efi_zboot_header *)*buffer;

This isn't valid, because *buffer might not be properly aligned.
You can deal with that by defining your uint32_t fields to be uint8_t[]
and accessing the contents via ldl_le_p().

> +
> +    /* ignore if this is not a Linux EFI zboot image */
> +    if (memcmp(&header->zimg, "zimg", 4) !=3D 0 ||
> +        memcmp(&header->linux_magic, LINUX_EFI_PE_MAGIC, 4) !=3D 0) {

Do we not care about checking the msdos_magic[] ?

> +        return 0;
> +    }
> +
> +    if (strncmp(header->compression_type, "gzip", 4) !=3D 0) {

Is this field supposed to be NUL-terminated? If I am not confused
about strncmp(), I think this is comparing only the first 4
characters and so would match both "gzip" and "gzip-but-not-really".

> +        fprintf(stderr, "unable to handle EFI zboot image with \"%s\" co=
mpression\n",
> +                header->compression_type);

This assumes the field is NUL-terminated and will do something
silly if fed a file where it is not.

> +        return -1;
> +    }
> +
> +    data =3D g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
> +    bytes =3D gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES,
> +                   *buffer + le32_to_cpu(header->payload_offset),
> +                   le32_to_cpu(header->payload_size));

I think we should bounds-check that the payload offset and size
are actually all within the input buffer first.

> +    if (bytes < 0) {
> +        fprintf(stderr, "failed to decompress EFI zboot image\n");
> +        g_free(data);
> +        return -1;
> +    }
> +
> +    g_free(*buffer);
> +    *buffer =3D g_realloc(data, bytes);
> +    *size =3D bytes;
> +    return 0;
> +}
> +
>  /*
>   * Functions for reboot-persistent memory regions.
>   *  - used for vga bios and option roms.
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 70248e0da77908c1..d1092c8bfbd903c7 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -86,6 +86,8 @@ ssize_t load_image_gzipped_buffer(const char *filename,=
 uint64_t max_sz,
>                                    uint8_t **buffer);
>  ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t m=
ax_sz);
>
> +int unpack_efi_zboot_image(uint8_t **buffer, int *size);
> +

New global functions should have a doc-comment format comment
describing them in the header file. (This is one of those areas where
we have a bunch of legacy code that doesn't conform to our ideals and
are trying to gradually ratchet up by imposing a standard on new
contributions.)

thanks
-- PMM

