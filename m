Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF1C52CD79
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:49:38 +0200 (CEST)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nraue-0003fY-QV
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrar5-0001aA-Dd
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:45:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrar3-0000vr-MK
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:45:55 -0400
Received: by mail-ej1-x62c.google.com with SMTP id y13so7511740eje.2
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ia8jMc0hXir9lQIp+mopQnhQVEaorwUTwNLD3kv/qg=;
 b=DU/eJKwJKYxhoiDJCYxtBbNPWpB2OZl2aHfcbcppbirAJszGVf+SncoATl745mtmBB
 u8/xwtPuYQI2n3hmKb1DuosXjqpEgim5cMR1GtjMcSmXZmLHAyrJnBM6O6q8g+wP+NxN
 Z8W5oDHDb6QG40eNt9ZwQceP/aR3cW7hXSI0uoUh3X4J900smEPyb3WofioXfcE++Kyc
 Ym/WcVddLEQifIv3azPqdhAUbTUiG5iqYbUpRz4Csdyp21s/fzZMz/793E10C7m5cczL
 lyOgXwhud8xa9WV0BjCvBCvqet265JXvzSKpMbwp7nxkqVhs12ViQaUXyR5oLeCJ3YCD
 +5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ia8jMc0hXir9lQIp+mopQnhQVEaorwUTwNLD3kv/qg=;
 b=N5m/3ooOiSm2RgxNKHC7RY8Ly1ot6w4ZC6gvoDOSamGKa2A300SYQUffTg+caXkVZj
 /8FVjCLvhd8oipv8lbk+qUu3PBw9n2S+eSyg6a9CmEkWmj2Gnnfei7aGcl2wWg2zkqGL
 Adt6e52BkW1MK+l57bPIlXx5uF9wzl4iacfz7Qp/sbmr1I8tz8eq/wYLpdd+SWR3TRZ1
 jkDVbddxx908TNcmo4vLenoCSKUe4oAw5s8/vBUr57oxzKeVh2Z3Fv2aixyAg03LCuYm
 36Q/keQrUNemc/a6HBEUPvmMzDqh+zF5DL/+u4Odse2iQ1KwKj8DIgnKQITIa4o8fk6J
 lzgw==
X-Gm-Message-State: AOAM530xKDfMQuJ8+T1lophsrg4u7x/hPc1GwGrxZRQSYOH/9qv2jsih
 3rBXYJEa3VsLz3wc76YB5NNEV2PwAXp/Ka1BJlaZcA==
X-Google-Smtp-Source: ABdhPJwcXH5r6sLdYY794q04x2QHjmdj8h4EI/F5t9r2D629khdFi0Q3Ka+Vcdo/sldqNF85spEFyvJjqJRsuoyMDOs=
X-Received: by 2002:a17:907:94cf:b0:6f5:942:5db7 with SMTP id
 dn15-20020a17090794cf00b006f509425db7mr2944845ejc.625.1652946350839; Thu, 19
 May 2022 00:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
 <20220518110839.8681-2-mark.cave-ayland@ilande.co.uk>
 <CAARzgwx4u0N1-XC2z18kKJZ3gkna22YMZ3nw+tikJt=sv-zc-w@mail.gmail.com>
 <db251587-d70e-76d7-e4e7-925075a2ed28@ilande.co.uk>
In-Reply-To: <db251587-d70e-76d7-e4e7-925075a2ed28@ilande.co.uk>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 19 May 2022 13:15:40 +0530
Message-ID: <CAARzgwxEU4hnSW4=1uYj_Pp6YZxm-FWahLoHwS_yArMvi7zbig@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/acpi/viot: rename build_pci_range_node() to
 pci_host_bridges()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, jean-philippe@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
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

On Wed, May 18, 2022 at 5:57 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 18/05/2022 12:36, Ani Sinha wrote:
>
> > On Wed, May 18, 2022 at 4:38 PM Mark Cave-Ayland
> > <mark.cave-ayland@ilande.co.uk> wrote:
> >>
> >> This is in preparation for separating out the VIOT ACPI table build from the
> >> PCI host bridge numeration.
> >>
> >> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> ---
> >>   hw/acpi/viot.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> >> index c1af75206e..2897aa8c88 100644
> >> --- a/hw/acpi/viot.c
> >> +++ b/hw/acpi/viot.c
> >> @@ -17,7 +17,7 @@ struct viot_pci_ranges {
> >>   };
> >>
> >>   /* Build PCI range for a given PCI host bridge */
> >> -static int build_pci_range_node(Object *obj, void *opaque)
> >> +static int pci_host_bridges(Object *obj, void *opaque)
> >
> > Please rename this as build_pci_host_bridges()
>
> I'm not sure this makes sense?

How about enumerate_pci_host_bridges() then?

 The naming here is deliberate since the whole aim of
> patches 1-3 is to remove the ACPI table build code out of this function so that its
> only purpose is to enumerate the PCI host bridges. This is similar to the approach
> already taken in hw/arm/virt-acpi-build.c in build_iort().
>
> >>   {
> >>       struct viot_pci_ranges *pci_ranges = opaque;
> >>       GArray *blob = pci_ranges->blob;
> >> @@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> >>       };
> >>
> >>       /* Build the list of PCI ranges that this viommu manages */
> >> -    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
> >> +    object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
> >>                                      &pci_ranges);
> >>
> >>       /* ACPI table header */
> >> --
> >> 2.20.1
>
>
> ATB,
>
> Mark.

