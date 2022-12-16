Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B964EE78
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:04:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DAo-000684-HE; Fri, 16 Dec 2022 11:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DAa-00060N-FZ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:02:45 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DAY-0002f5-60
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:02:43 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so2772708pjd.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ESwyWES+vqkdIgAairo2zNVacbSK0nNos5C9iCvq9ig=;
 b=WqKBQg/Up0OldkhWKSyGgwl1Po1GXYEgnj8GCaCgsbjkMYZi6KAxRbeDJuJQ8GM76O
 nl/wdVJMPKHr4d/F4aKN2UnRwtikwU0ntIjVPX9Oroj3PX+i57HMvzuFh6u+kh0OOic0
 Gq5OPn38Ayg7PkX7ulat5/DqdgtzDfIxraVYZs1nw+54eLDcjh4wZ8O7Me5MGI3w/bvi
 nNynT0Xd7/E6ZIu35viPIdGHRDGEH466SCZVoXsXmmE5E6SinjPupRqUg/AwvyGc+BT9
 SQ+yNebSvPTK0Ctc6zP94VJ9jamN/gQ6uao5W4mDj4T46oN9e04Xgf2gmuDDtIestVm8
 PLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESwyWES+vqkdIgAairo2zNVacbSK0nNos5C9iCvq9ig=;
 b=eQKxRnPtQ03r6XaAIRIuUeWNruub538JHWijEISJBuY2WXsGAYwzZRiDiGcu9ACORV
 4S6/MRMMjL4jsSp+nJ8uP1iwuJnLyPa4H8UPmyfc8rwf1suDrZdNKybe59JSy6ofjUN4
 hWC/W6+f8qbjRID/R8GvnebG9q6W+bL5PPp604k5u2axhev8jjQDJdoN/l2hHYm6fI5w
 WyE17rYH+yeHy39VKkpk/lOn4RN/To83xM8yUKDdRtnwWO04uKjQmBEvlXsokdQIZo1X
 njobrGUaYu8q05/3bC7n4azgl2/1QOcAD717N8zfwZ89CSuuwMs1mLMV1G++vef5vYjg
 8ixA==
X-Gm-Message-State: AFqh2kqIaS4R1j4p5I/t2w7eGwKUAtsPb8YaSNFR5S9MfBnHTdSO5oiJ
 iHIho0GCi3HlTbHwt/bABjkvzw/jknCWwOO3rCa4dbCs60h3OURd
X-Google-Smtp-Source: AMrXdXtrVMLEDLQ9bWb0u4f+rwgb228tSPz/pkJSjYindjrT0z9E4ScqiXXbHJxIep/m7Ui6qzXzsUaQboSSv/nUrb8=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr660823pjb.221.1671206560390; Fri, 16
 Dec 2022 08:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 16:02:29 +0000
Message-ID: <CAFEAcA9XHPwgdnFoaZQAzPkm-6vJ0BNmqfc=7q_TwJziYtk=sw@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/7] virtio, pci, xics: 3-phase reset conversions
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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

On Fri, 25 Nov 2022 at 11:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts a miscellaneous collection of classes
> to 3-phase reset. The common link, as with other series I've
> sent out recently, is converting child classes that currently
> use device_class_set_parent_reset() so that we can remove
> that function. To do this we first need to convert the parent
> class, and then the subclass.
>
> The first two patches handle TYPE_VIRTIO_VGA_BASE, and its parent
> TYPE_VIRTIO_PCI.
>
> The second two handle the parent TYPE_PCIE_ROOT_PORT and its two
> child classes TYPE_CXL_ROOT_PORT and TYPE_PNV_PHB_ROOT_PORT.
>
> The last three deal with TYPE_PHB3_MSI and the parenT TYPE_ICS.


I plan to pick these up and send them in in a pullreq with
various other reset-related patches of mine.

thanks
-- PMM

