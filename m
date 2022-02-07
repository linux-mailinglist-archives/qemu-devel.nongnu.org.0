Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED424AB9B8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:25:01 +0100 (CET)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH28i-0000ly-Q9
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH24Y-0006zI-Oz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:20:42 -0500
Received: from [2a00:1450:4864:20::62d] (port=39546
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nH24W-0007z6-M5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:20:42 -0500
Received: by mail-ej1-x62d.google.com with SMTP id j14so17625432ejy.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7i8PFJUJjh3yQvAfM8T2QTQ//AMO7nRiJ3Igw+Lx3o=;
 b=eyvaX8fPAOvSg/G1r6/kUEVv72/9irhjG6nsx90E5VAKVBuVoZkCgbEeotu/ax8BVk
 oW8Gx5q7YqKmMNap1ZN9mGWPW/swENGadcpR8rV0AwlBHt6KWfZ15/okAsawzLOaA9m/
 SQvc6KrdqFB3VJWGS7Xsy2ZVjRO5NTIhCq5n+rWwzPRsOsEAIi+irZVFoN5FPjpsm5ti
 GwcBnldsrVKT+QPUjm/hZYpWWLn8h7ZqCfK5cFTgezCu873vhCYQUXhFQbRUboP+60oH
 safPfLU3aVBvGXXy44ecwAevzJJqMvXW5zt6rgoEzBFm6Trxhi9qsJhy0lQ6xpXB3ehs
 O8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7i8PFJUJjh3yQvAfM8T2QTQ//AMO7nRiJ3Igw+Lx3o=;
 b=DTPWpzlwQYtaF6KJjepPP53LEsY9OlpBGY90LDfLzDWsdERHJJKPW+9sD4T7JnOCyS
 Yhq8D3y1lRrg4JQDCF6YsNXdK0A1j+ud/6HY9x0OuiU/9jjZSIOx+7BS84WAX1QpGcS8
 j+F+cMorreIlXZREyaFcOGn9YaBglGnkIUjsFbYyQ9pQ02fkVJg0WUuO/Vlq5S+8az4Y
 bYZLPdajXqxF/5SG8e5QUCxIBdUWQuVsxoPSHsf6qhjf71DwRX0w5pPZVqbZ44L5P1/3
 AVnbFk15Dz/0r8EOiQV2sNPfT+umUqpvHM7x95LHXTPvMtOfJf61quDqesmhNUYypleA
 wlKg==
X-Gm-Message-State: AOAM532AzekOWtex4AFNdcMidTBi2it8kPCAZADzgWJzbHDPJFSkznWh
 O87vfIT9lckL2+FKE0qqjGwAVe29XIYzyNzGE0JF9A==
X-Google-Smtp-Source: ABdhPJzVIFWYlidcAKbTrlxNk+DIKnX63BLjfs/sIMBR+VDKDqUIhG9mXr+r7tzQ2VVS8GV9OHt3qiNHhDO/pU94a8s=
X-Received: by 2002:a17:907:9493:: with SMTP id
 dm19mr9453191ejc.51.1644232839155; 
 Mon, 07 Feb 2022 03:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com> <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk> <YgDpYTpdk9hJeL6v@angien.pipo.sk>
In-Reply-To: <YgDpYTpdk9hJeL6v@angien.pipo.sk>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 7 Feb 2022 16:50:28 +0530
Message-ID: <CAARzgwyjH70AaEZ=DNSARP++KJfAi2wZkpx6uOhpW0jEigf16A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
To: Peter Krempa <pkrempa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 3:12 PM Peter Krempa <pkrempa@redhat.com> wrote:
>
> On Mon, Feb 07, 2022 at 10:36:42 +0100, Peter Krempa wrote:
> > On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > > On Mon, 7 Feb 2022 09:14:37 +0100
> > > Igor Mammedov <imammedo@redhat.com> wrote:
>
> [...]
>
> > Even if we change it in libvirt right away, changing qemu will break
> > forward compatibility. While we don't guarantee it, it still creates
> > user grief.
>
> I've filed an upstream issue:
>
> https://gitlab.com/libvirt/libvirt/-/issues/272

I can look into this bug. Feel free to assign it to me.

