Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5333EB796
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:19:11 +0200 (CEST)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYxi-00045D-GK
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYwv-0003Hd-LH
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:18:21 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYwr-000413-F1
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:18:21 -0400
Received: by mail-ej1-x631.google.com with SMTP id u3so18962178ejz.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2B3jBFAWI0lHXkD+cg2NonsiQugX9FCeWGq+OHl2Hw=;
 b=Djbp1/lps4VnJmR26TjooS7QDKL7jc6uKAxwwtY0s51D7HOEIMMaTYRaweoF98mnSZ
 YiEgMYvO8EIr5t8/rZJBfeJIJ6hQ4G7MZSQeGecdOtTfU5Q85tY4IEDk8DNFctZs2Zsm
 A7dhbr3zBXiiRk7IyvVn1AYP0WQj7VihneFcabYp1YDv/tYHQb9aEzi3pbXX8mVTk5To
 GmnnDzHgpwcwoKYufjukGMjNh97/jFSfkmsu2eC2wNWIW9EobdhqT722JidH+smn8iBu
 WbJtrnawFeom2PHHZQ0GgqrzugNQft+Ybpm6VHQeBlV/xDe6WGSW7Yp8EHxXEXTZjtWb
 6VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2B3jBFAWI0lHXkD+cg2NonsiQugX9FCeWGq+OHl2Hw=;
 b=tc6iGWap/AeFCRBSl1JWp3B+U3EfVvOdZ4e+9QX761ZGo2mfwuG1O35nh6dBNM4v6j
 2VkWNYnvE4kG2JDYtlBL2PMGg27Vjkia9BLXlud55vDErYbAuGvca6k4Ch6Wedrqo0rK
 nc2scgq4qehF+xJ0wYZijEqlwwgt/TQIW0uoss4ySiC6aXmPPQ9ipdNe5M+PHokZhEpM
 +gYvAqBT9i8S6xM64O2udOmyb2iJp/MTYzmEDv/Rdv1ewftSseKIi0IfSKEgG4dKKlsp
 yoko+lpV25rN4aP8a403E0ytOiKi1/rrfT1e81q0q6tQnY6iqq6QhUmWfDnPuuTNE4rz
 Laqg==
X-Gm-Message-State: AOAM531cSYNmZo30zvfwdhT3Zwp06k0POaDpf5QYum0EiW4FOJQhB/Ui
 RzKTQctaSV/PfedKx8USKi9okh4C+iaHQnHYY4e/5Q==
X-Google-Smtp-Source: ABdhPJy5G4OisK+FPwwOYuix0MjQe+dkQCVCExbpJo/qV3HfRjOKgMnhVzn9zT/4A78Ancb7oEqX5E3MpeJbqyEPUlA=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr2964571ejf.482.1628867895966; 
 Fri, 13 Aug 2021 08:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
In-Reply-To: <YRIAr6HIW742LSZd@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 16:17:30 +0100
Message-ID: <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 05:40, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Mon, Aug 09, 2021 at 10:57:00AM +0100, Peter Maydell wrote:
> >
> > Cleanest fix would be to declare 'path' and 'host' as
> >    g_autofree char *path = NULL;
> >    g_autofree char *host = NULL;
> > and then you can remove all the manual g_free(path) and g_free(host) calls.
>
> Thanks for the report.  I've committed the fix (I hope) below to ppc-for-6.1:
>
> From 70ae61b510dc571c407b28c46498cae60e60ca66 Mon Sep 17 00:00:00 2001
> From: David Gibson <david@gibson.dropbear.id.au>
> Date: Tue, 10 Aug 2021 14:28:19 +1000
> Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with
>  g_autofree
>
> This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
> in the process fixing a leak in one of the paths.  I'm told this fixes
> Coverity error CID 1460454
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/spapr_pci.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7a725855f9..13d806f390 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -782,33 +782,28 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>
>  static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
>  {
> -    char *path = NULL, *buf = NULL, *host = NULL;
> +    g_autofree char *path = NULL;
> +    g_autofree char *host = NULL;
> +    char *buf = NULL;
>
>      /* Get the PCI VFIO host id */
>      host = object_property_get_str(OBJECT(pdev), "host", NULL);
>      if (!host) {
> -        goto err_out;
> +        return NULL;
>      }
>
>      /* Construct the path of the file that will give us the DT location */
>      path = g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
> -    g_free(host);
>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> -        goto err_out;
> +        return NULL;
>      }
> -    g_free(path);
>
>      /* Construct and read from host device tree the loc-code */
>      path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
> -    g_free(buf);

This deletion doesn't look right -- 'buf' is not autofree
(and shouldn't be, since we're returning it).

If you want to delete this 'g_free' you need to make the
first g_file_get_contents() use a separate char* variable from
the variable we use to return the eventual result data buffer;
then you can make that new variable be g_autofree.

>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> -        goto err_out;
> +        return NULL;
>      }
>      return buf;
> -
> -err_out:
> -    g_free(path);
> -    return NULL;
>  }

thanks
-- PMM

