Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDF5252B2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:36:24 +0200 (CEST)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBnb-000754-Tp
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBgv-00028g-Jp
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:29:30 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBgt-0003yu-JU
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:29:29 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v59so10715965ybi.12
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f3mI6kUv/ydQ5/PAqcwTfRFn21jqBnNk5vqFwOzQtyw=;
 b=CY9Xbuq3BPEvM7AL1Gl2ETUVGyjMdMGnjfadVc5rjXuNIfq3hs41TNa/N+sRbOqcwH
 zUQsrr0xVRw7IcXH/7MR2aykBYM7v1VI7jxp40H4dd98yg/wJu2iD9w5qnHefT/Wh80G
 I1LjYC4yNF8y7m28NhmrksuUCcmVCoEjXt6edvJMrVyPgb+CQpusM1RVUD23Awu7YOhC
 BI/d6XVKh7qCKUj/ypEBfMTXrR45pQv/98XrxkPaB2PuMb4yYFg/mXfmAw96qIBYalil
 wLdoovCOEekrw5NTO6mUJL83g+uaA52qHhTEk+3tUWedM3HCzq+d8lHrH0JVWyVP3aCP
 t/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3mI6kUv/ydQ5/PAqcwTfRFn21jqBnNk5vqFwOzQtyw=;
 b=Rxe3D4yZNVGwxTc+huonjPIw+4GYca6CReDMM5c41GS7Le90W0K+qRxvp4IP4yciS4
 BwsYkVmMVFWdt0+bAMImM5upCrBZtareExZShiR3e8k86xewQZLnpv4MGWZIiIcSCPqJ
 42rnrE1yohHme6TnpFHhcg8hIsYyrTC7tXFB2WClZ1X6/DX9w0j4+LsecXK6NcFL4QrL
 BN5mvEOjr0/r8O6BLjZsWlRXote1B/TiMZRTYqbY4pGS1fgKqa9h7K4KQz5eSY7YFHtE
 24ZWFfZS82W/WumvXX3vnD2fK+Z3NLnlFkga2RC7bf2KDQFF33d46JZ/Ga+qLT/N/gdq
 +CHA==
X-Gm-Message-State: AOAM532ASWhpRuGGVqloHstY9YZkEsGKZ0VlvF+ueyUdC8n/1nShaa2H
 KcYY5M0b08pjGQVLomFdML7uLySNe6nC/lgnQZNMBg==
X-Google-Smtp-Source: ABdhPJysmpE9eox7Mg8XetxM3dB30fmxH8qhT4QzIH0eCKiN5A+zG8ZYLmPPvVFehSYDxVvsyaVIm/bWqBIhmWvGP7Y=
X-Received: by 2002:a25:6f85:0:b0:64a:8b67:d3b2 with SMTP id
 k127-20020a256f85000000b0064a8b67d3b2mr602821ybc.85.1652372966595; Thu, 12
 May 2022 09:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220206093702.1282676-1-mst@redhat.com>
 <20220206093702.1282676-19-mst@redhat.com>
In-Reply-To: <20220206093702.1282676-19-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 17:29:15 +0100
Message-ID: <CAFEAcA-GDW6AgcvPgaYVxJbC=Y08br=MJHhrJX9DMj-w25mEsQ@mail.gmail.com>
Subject: Re: [PULL v2 18/24] ACPI ERST: support for ACPI ERST feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Eric DeVolder <eric.devolder@oracle.com>, 
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 6 Feb 2022 at 09:38, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Eric DeVolder <eric.devolder@oracle.com>
>
> This implements a PCI device for ACPI ERST. This implements the
> non-NVRAM "mode" of operation for ERST as it is supported by
> Linux and Windows.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> Message-Id: <1643402289-22216-6-git-send-email-eric.devolder@oracle.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

Hi; Coverity points out a bug in this function (CID 1487125):

> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> +{
> +    ERSTStorageHeader *header;
> +    uint32_t record_size;
> +
> +    header = memory_region_get_ram_ptr(s->hostmem_mr);
> +    s->header = header;
> +
> +    /* Ensure pointer to header is 64-bit aligned */
> +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
> +
> +    /*
> +     * Check if header is uninitialized; HostMemoryBackend inits to 0
> +     */
> +    if (le64_to_cpu(header->magic) == 0UL) {
> +        make_erst_storage_header(s);
> +    }
> +
> +    /* Validity check record_size */
> +    record_size = le32_to_cpu(header->record_size);
> +    if (!(
> +        (record_size) && /* non zero */
> +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
> +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
> +        (record_size >= 4096) /* PAGE_SIZE */
> +        )) {
> +        error_setg(errp, "ERST record_size %u is invalid", record_size);

Here we check that record_size is sensible, including that it is
not zero. But we forget to return early after error_setg(), which means...

> +    }
> +
> +    /* Validity check header */
> +    if (!(
> +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
> +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
> +        (le16_to_cpu(header->version) == 0x0100) &&
> +        (le16_to_cpu(header->reserved) == 0)
> +        )) {
> +        error_setg(errp, "ERST backend storage header is invalid");
> +    }
> +
> +    /* Check storage_size against record_size */
> +    if (((s->storage_size % record_size) != 0) ||

...that we fall through to here, where we will divide by zero if
record_size is 0.

> +         (record_size > s->storage_size)) {
> +        error_setg(errp, "ACPI ERST requires storage size be multiple of "
> +            "record size (%uKiB)", record_size);
> +    }
> +
> +    /* Compute offset of first and last record storage slot */
> +    s->first_record_index = le32_to_cpu(header->storage_offset)
> +        / record_size;
> +    s->last_record_index = (s->storage_size / record_size);
> +}
> +

The fix is probably simply to add return statements after each error_setg()
in the function.

thanks
-- PMM

