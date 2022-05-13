Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD3525C76
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:43:32 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPxS-0007jY-Rh
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1npPof-0001YS-Vu
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:34:26 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1npPod-0001XD-Me
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:34:25 -0400
Received: by mail-ed1-x532.google.com with SMTP id w24so8950917edx.3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V21UUIyisdnflP1weKJeYoaBNQhCCz/47CO89qo/a1o=;
 b=UrW3uZLvTlT9SecNT49Yhav0x7HdTn/hWcCwVjIGLPEiA50stlPzNb+2lkZgE/QblC
 WqyDuAzMvIm3iTdyyByhLkVgaTid/XOrisDFDpwpV9oJgPwkPWiafy42osfwOxP0Il4/
 EcYi00SW3h8UOcuoEHAfMsV1MP7a2xHEMNIZ+EtBkrWQYvvSqdLjkaFQpGIx6I49ML8e
 LwtTSvgT6Z483WWb0rBBcmqZ8/3lUZZ/I7Ay23R3WtNYT3W40ax4liDZ0NhIgkSnnhal
 37p1NjUfPnCBHsbM2Z3IellZEYNDXYnoExSrCJwnuNeEB2z28jJtkLMTNyzCjIRL6cvZ
 Tlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V21UUIyisdnflP1weKJeYoaBNQhCCz/47CO89qo/a1o=;
 b=bEeNijs5oSeMTDudJpiIt3cgQQ/ytebbYUzMsrva7MW8stQJe/KtPblBfZrzyZEzqJ
 yhE9DUwuxFJ1IdYQ90lXGDK1eaK64SxtlgR4uULCxbAeqZzulZn079eof6LMd1K3haJ3
 e9CdfHozFS2nWWhLoFPthU0QRi3cV9lvYAmFJb52Jo8S934qhL4+HdM7fxIMh98GWXpd
 uIkJY0K0mKNEyUt4xYuVgptNBdogpEsVAyn8gQJ7sKukmvfGkVf4JJVxpO65lZlwS+4C
 YBnazMK2hYqvH3hsFG4gQj2oIjGz+M3oOX6bBAKXpIrUIZAEkel5nQGHUNIPce/tTm+r
 xfpg==
X-Gm-Message-State: AOAM5316qpHt/8bN4e+ZyJ1YnPtKWwzPwGncl/RB8LJDfVOw8G+wg3mu
 VzbbCweGIjHpKRSQ1DIPZnJ1qeVknr8C1GQ921m4xw==
X-Google-Smtp-Source: ABdhPJykw7RIfU0Md+RM4QFypg79r9PZV/kdB+o6jj68UhjXpOInry0ljyROMmxAr7A5qkiVcRzuL/7+Z4VTnYHsQWs=
X-Received: by 2002:a05:6402:354a:b0:427:d0e1:8ef3 with SMTP id
 f10-20020a056402354a00b00427d0e18ef3mr39252932edd.66.1652427261753; Fri, 13
 May 2022 00:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220206093702.1282676-1-mst@redhat.com>
 <20220206093702.1282676-19-mst@redhat.com>
 <CAFEAcA-GDW6AgcvPgaYVxJbC=Y08br=MJHhrJX9DMj-w25mEsQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-GDW6AgcvPgaYVxJbC=Y08br=MJHhrJX9DMj-w25mEsQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 13 May 2022 13:04:10 +0530
Message-ID: <CAARzgwy-fGHh5E6hNpY6n=CZ+d+P1VKwhyeDKiHF8dZ3+n3fug@mail.gmail.com>
Subject: Re: [PULL v2 18/24] ACPI ERST: support for ACPI ERST feature
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 12, 2022 at 9:59 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 6 Feb 2022 at 09:38, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Eric DeVolder <eric.devolder@oracle.com>
> >
> > This implements a PCI device for ACPI ERST. This implements the
> > non-NVRAM "mode" of operation for ERST as it is supported by
> > Linux and Windows.
> >
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > Message-Id: <1643402289-22216-6-git-send-email-eric.devolder@oracle.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
>
> Hi; Coverity points out a bug in this function (CID 1487125):
>
> > +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> > +{
> > +    ERSTStorageHeader *header;
> > +    uint32_t record_size;
> > +
> > +    header = memory_region_get_ram_ptr(s->hostmem_mr);
> > +    s->header = header;
> > +
> > +    /* Ensure pointer to header is 64-bit aligned */
> > +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
> > +
> > +    /*
> > +     * Check if header is uninitialized; HostMemoryBackend inits to 0
> > +     */
> > +    if (le64_to_cpu(header->magic) == 0UL) {
> > +        make_erst_storage_header(s);
> > +    }
> > +
> > +    /* Validity check record_size */
> > +    record_size = le32_to_cpu(header->record_size);
> > +    if (!(
> > +        (record_size) && /* non zero */
> > +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
> > +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
> > +        (record_size >= 4096) /* PAGE_SIZE */
> > +        )) {
> > +        error_setg(errp, "ERST record_size %u is invalid", record_size);
>
> Here we check that record_size is sensible, including that it is
> not zero. But we forget to return early after error_setg(), which means...
>
> > +    }
> > +
> > +    /* Validity check header */
> > +    if (!(
> > +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
> > +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
> > +        (le16_to_cpu(header->version) == 0x0100) &&
> > +        (le16_to_cpu(header->reserved) == 0)
> > +        )) {
> > +        error_setg(errp, "ERST backend storage header is invalid");
> > +    }
> > +
> > +    /* Check storage_size against record_size */
> > +    if (((s->storage_size % record_size) != 0) ||
>
> ...that we fall through to here, where we will divide by zero if
> record_size is 0.
>
> > +         (record_size > s->storage_size)) {
> > +        error_setg(errp, "ACPI ERST requires storage size be multiple of "
> > +            "record size (%uKiB)", record_size);
> > +    }
> > +
> > +    /* Compute offset of first and last record storage slot */
> > +    s->first_record_index = le32_to_cpu(header->storage_offset)
> > +        / record_size;
> > +    s->last_record_index = (s->storage_size / record_size);
> > +}
> > +
>
> The fix is probably simply to add return statements after each error_setg()
> in the function.

Ah yes. OK I will send a patch as soon as I am able.

