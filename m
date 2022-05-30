Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59F5383CB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:00:26 +0200 (CEST)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgsa-0005jc-PT
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgqY-0004zm-NG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:58:22 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgqW-0004Za-Gv
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:58:18 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so4845698pjo.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ZBJlLsyvJ4Lmru1KJ1HOlPGw8vSvA+NwERF2S+u0GU=;
 b=mTNtmYr+RsMrSUMRaP682RAkb1jpOD8gBvSVXbxQWHntAPEwxG3gTjP5YzfviaqPMR
 4GhSNYx3jgggNzaS2AQce1PLB5JEPPhpAGdmypLwkpJCsCvzR8mMPkqwEXoJa+anji11
 R+XbC4Oxp7jnBfOjve5asgDqxgHeR5JsKHVYlw8PCMA4lRfDmRPOg8QeM0L6AZXUxOex
 98S88EH9/REQCZPlicc6dNuIqKPzlYuYPJJmZzXjbxpx0RWFM/I4IN5UJEoxqPeUh/KY
 UlQ/gZtKFtrRjdblF13NNCZT0+P+OlSKCGjdvUuYWH1gz/jtWlOqIivLF812IFB45OFu
 0aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ZBJlLsyvJ4Lmru1KJ1HOlPGw8vSvA+NwERF2S+u0GU=;
 b=RMDy7iCIjDg8NitToIApqcd7Heve7V1MGjQPsGaYsLQz+NeTDgZG/re2TuARfTS32N
 7q19yCUiR07AxiF7tzv1Dbv4Mh57KiRo0Pyy+zBwAzRMQ/dL0xgV+a8DBx4K0HvacmHI
 PoqLQxbEz8CVo8+WOs40H/7wUrNV2VT7EV+nA20c4QnSoKv85BthSG35yc3BOZnTK0cP
 Wbn/HhUO6Eqz6L7bWL5B+imkGv6lpqvt84AJiEcvwU+dzb3pMFT1L5NqjZqMm+jM6p+8
 8ikhHNmb+2xKXZrO7DNW7+hX8y+pfud6kSiHDV2DoOzSQbFSH6scFHl8dMrFT1pGHGHX
 Q3Dg==
X-Gm-Message-State: AOAM533tmFJ8PkWry3v4cjWsh61A7bsl0mi5TA5uONkdMfmAUdL3t9lA
 B3m3t2D+BSd9x4F5EblCIwc=
X-Google-Smtp-Source: ABdhPJyQ0H6M4CRhqyfWTxdNSTpF0zw6ve3pWIzhVIQ3vHhLPdN1SyO60guLBPR1OYB2CQdt0OiR2A==
X-Received: by 2002:a17:902:900b:b0:161:612f:ca76 with SMTP id
 a11-20020a170902900b00b00161612fca76mr55424653plp.170.1653922693953; 
 Mon, 30 May 2022 07:58:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a170902d10300b0016152774878sm3090615plw.176.2022.05.30.07.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:58:13 -0700 (PDT)
Message-ID: <282e67cb-53b8-c7b9-a496-eda44d8a5e2b@amsat.org>
Date: Mon, 30 May 2022 16:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] loader: support loading large files (>=2GB)
Content-Language: en-US
To: Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <lmichel@kalray.eu>, Alistair Francis <alistair@alistair23.me>
References: <20220427230716.2158127-1-pcc@google.com>
In-Reply-To: <20220427230716.2158127-1-pcc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Peter,

On 28/4/22 01:07, Peter Collingbourne wrote:
> Currently the loader uses int as the return type for various APIs
> that deal with file sizes, which leads to an error if the file
> size is >=2GB, as it ends up being interpreted as a negative error
> code. Furthermore, we do not tolerate short reads, which are possible
> at least on Linux when attempting to read such large files in one
> syscall.
> 
> Fix the first problem by switching to 64-bit types for file sizes,
> and fix the second by introducing a loop around the read syscall.

Hmm maybe worth rebasing on this patch from Jamie which also
fixes the format on 32-bit hosts:
https://lore.kernel.org/qemu-devel/20211111141141.3295094-2-jamie@nuviainc.com/

(Personally I prefer to read ssize_t while reviewing instead
of int64_t).

While here, please have a look at this other patch from Jamie:
https://lore.kernel.org/qemu-devel/20211111141141.3295094-3-jamie@nuviainc.com/

Also, Cc'ing the maintainer:

$ ./scripts/get_maintainer.pl -f hw/core/generic-loader.c
Alistair Francis <alistair@alistair23.me> (maintainer:Generic Loader)

> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
>   hw/core/generic-loader.c |  2 +-
>   hw/core/loader.c         | 44 ++++++++++++++++++++++++----------------
>   include/hw/loader.h      | 13 ++++++------
>   3 files changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index c666545aa0..0891fa73c3 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -67,7 +67,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>       GenericLoaderState *s = GENERIC_LOADER(dev);
>       hwaddr entry;
>       int big_endian;
> -    int size = 0;
> +    int64_t size = 0;
>   
>       s->set_pc = false;
>   
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index ca2f2431fb..d07c79c400 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -115,17 +115,17 @@ ssize_t read_targphys(const char *name,
>       return did;
>   }
>   
> -int load_image_targphys(const char *filename,
> -                        hwaddr addr, uint64_t max_sz)
> +int64_t load_image_targphys(const char *filename,
> +                            hwaddr addr, uint64_t max_sz)
>   {
>       return load_image_targphys_as(filename, addr, max_sz, NULL);
>   }
>   
>   /* return the size or -1 if error */
> -int load_image_targphys_as(const char *filename,
> -                           hwaddr addr, uint64_t max_sz, AddressSpace *as)
> +int64_t load_image_targphys_as(const char *filename,
> +                               hwaddr addr, uint64_t max_sz, AddressSpace *as)
>   {
> -    int size;
> +    int64_t size;
>   
>       size = get_image_size(filename);
>       if (size < 0 || size > max_sz) {
> @@ -139,9 +139,9 @@ int load_image_targphys_as(const char *filename,
>       return size;
>   }
>   
> -int load_image_mr(const char *filename, MemoryRegion *mr)
> +int64_t load_image_mr(const char *filename, MemoryRegion *mr)
>   {
> -    int size;
> +    int64_t size;
>   
>       if (!memory_access_is_direct(mr, false)) {
>           /* Can only load an image into RAM or ROM */
> @@ -963,7 +963,8 @@ int rom_add_file(const char *file, const char *fw_dir,
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
>       Rom *rom;
> -    int rc, fd = -1;
> +    int fd = -1;
> +    size_t bytes_read = 0;
>       char devpath[100];
>   
>       if (as && mr) {
> @@ -1003,11 +1004,17 @@ int rom_add_file(const char *file, const char *fw_dir,
>       rom->datasize = rom->romsize;
>       rom->data     = g_malloc0(rom->datasize);
>       lseek(fd, 0, SEEK_SET);
> -    rc = read(fd, rom->data, rom->datasize);
> -    if (rc != rom->datasize) {
> -        fprintf(stderr, "rom: file %-20s: read error: rc=%d (expected %zd)\n",
> -                rom->name, rc, rom->datasize);
> -        goto err;
> +    while (bytes_read < rom->datasize) {
> +        ssize_t rc =
> +            read(fd, rom->data + bytes_read, rom->datasize - bytes_read);
> +        if (rc <= 0) {
> +            fprintf(stderr,
> +                    "rom: file %-20s: read error: rc=%zd at position %zd "
> +                    "(expected size %zd)\n",
> +                    rom->name, rc, bytes_read, rom->datasize);
> +            goto err;
> +        }
> +        bytes_read += rc;
>       }
>       close(fd);
>       rom_insert(rom);
> @@ -1671,7 +1678,7 @@ typedef struct {
>       HexLine line;
>       uint8_t *bin_buf;
>       hwaddr *start_addr;
> -    int total_size;
> +    int64_t total_size;
>       uint32_t next_address_to_write;
>       uint32_t current_address;
>       uint32_t current_rom_index;
> @@ -1767,8 +1774,8 @@ static int handle_record_type(HexParser *parser)
>   }
>   
>   /* return size or -1 if error */
> -static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
> -                          size_t hex_blob_size, AddressSpace *as)
> +static int64_t parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
> +                              size_t hex_blob_size, AddressSpace *as)
>   {
>       bool in_process = false; /* avoid re-enter and
>                                 * check whether record begin with ':' */
> @@ -1832,11 +1839,12 @@ out:
>   }
>   
>   /* return size or -1 if error */
> -int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
> +int64_t load_targphys_hex_as(const char *filename, hwaddr *entry,
> +                             AddressSpace *as)
>   {
>       gsize hex_blob_size;
>       gchar *hex_blob;
> -    int total_size = 0;
> +    int64_t total_size = 0;
>   
>       if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
>           return -1;
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 5572108ba5..7b09705940 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -40,8 +40,8 @@ ssize_t load_image_size(const char *filename, void *addr, size_t size);
>    *
>    * Returns the size of the loaded image on success, -1 otherwise.
>    */
> -int load_image_targphys_as(const char *filename,
> -                           hwaddr addr, uint64_t max_sz, AddressSpace *as);
> +int64_t load_image_targphys_as(const char *filename,
> +                               hwaddr addr, uint64_t max_sz, AddressSpace *as);
>   
>   /**load_targphys_hex_as:
>    * @filename: Path to the .hex file
> @@ -53,14 +53,15 @@ int load_image_targphys_as(const char *filename,
>    *
>    * Returns the size of the loaded .hex file on success, -1 otherwise.
>    */
> -int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
> +int64_t load_targphys_hex_as(const char *filename, hwaddr *entry,
> +                             AddressSpace *as);
>   
>   /** load_image_targphys:
>    * Same as load_image_targphys_as(), but doesn't allow the caller to specify
>    * an AddressSpace.
>    */
> -int load_image_targphys(const char *filename, hwaddr,
> -                        uint64_t max_sz);
> +int64_t load_image_targphys(const char *filename, hwaddr,
> +                            uint64_t max_sz);
>   
>   /**
>    * load_image_mr: load an image into a memory region
> @@ -73,7 +74,7 @@ int load_image_targphys(const char *filename, hwaddr,
>    * If the file is larger than the memory region's size the call will fail.
>    * Returns -1 on failure, or the size of the file.
>    */
> -int load_image_mr(const char *filename, MemoryRegion *mr);
> +int64_t load_image_mr(const char *filename, MemoryRegion *mr);
>   
>   /* This is the limit on the maximum uncompressed image size that
>    * load_image_gzipped_buffer() and load_image_gzipped() will read. It prevents


