Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9862C4558A8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:08:50 +0100 (CET)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneLZ-0003PP-OV
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:08:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mneHN-0007Yd-KA
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:04:29 -0500
Received: from [2a00:1450:4864:20::52f] (port=46599
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mneHL-0000wG-Mh
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:04:29 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y13so24354063edd.13
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oj6GlYQ0IJBw0eRSShX8uElo+hLE04BRhGxtpnOn3ts=;
 b=cP/WrUT+FSy904QrHGKKU3ozNehV++S/vEf0nCPsLOyOmnMlETsEyQbkTYLo6xxDyi
 RkeKpwCDo5jW2HMXwI52VPFMXuZOdOntSx0Q4sdiv7bo4n+1TjYY5nXEF9+7QN/G73LQ
 tSF1HLJ0B7GvOnCuCMeFfJLH67KObOt8+RJicsM/qnf+jp34tzjtOdtW9Eow//VeZngm
 7C+S0r4syPIpR2zTQYbraWv/DmJ/vI4K8L1XntBubBaRxjtd7wY7aOo0lMEN4MtWUi04
 R4UayYrA3Dd0cyiQZnDRbaPk+30tTh47WVkrs7i9dj44+uhkgWsOKTmvgOczsGgPxD9a
 cWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oj6GlYQ0IJBw0eRSShX8uElo+hLE04BRhGxtpnOn3ts=;
 b=wXX5DojRS9Ii2PkZVn2jHJtYwMvZBcYzkIMoG2R72BGuR/aCna1H7ckzWxxG0s55oF
 pUEgQo+khCEqyLklXjWqcNj6OM88UpILPP2U62IaJx8QqDv6yhtsU3LT06/47CrQ4jd0
 wGsI5Paq6+WVqsUdepndzdJp6ucPzRDRmxxbHkl+s1yF76lJFykdeXvdnhsXbTkRn7fE
 BSZ9usPFnmEt/ZkVoOaY/UL/W0Gcb5tLK2g4zs07y1HJcP8L0cFu8xV/WABtkGonwYqv
 zYqn9S8wsO/mjyOsRbpeTG//TO4gU6TmegmuZkk7yhymkVkUSwnaZ45+DGRjtdIZ5bHB
 6scQ==
X-Gm-Message-State: AOAM532BqjqlTHlpW2yd1Y+WUlRk3FFa8bkhCu8a0ImdnXc/J0IOInGg
 gbql0ZCnA2NRq90GsOzN92qzN+42kjgpVw2jplgSDw==
X-Google-Smtp-Source: ABdhPJzjQqNXYAVGiWUyUhTUHa5i8719KnkNGaUDE+qax+ZLohEKeknlV+5Xy0hFSawUAIFJwD4pJDli60NKTnsKDDA=
X-Received: by 2002:a50:955c:: with SMTP id v28mr9070888eda.293.1637229865676; 
 Thu, 18 Nov 2021 02:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <187a516b-9989-954a-4cab-834379d2a1d8@redhat.com>
 <20211018041855-mutt-send-email-mst@kernel.org>
 <720581b3-c0ec-0834-7ca4-c18a621853f4@redhat.com>
In-Reply-To: <720581b3-c0ec-0834-7ca4-c18a621853f4@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 18 Nov 2021 15:34:13 +0530
Message-ID: <CAARzgwxLc2qDFczH0HTLeoXsHGeBL5yQmbm3FQY8ErzYhQ3GgA@mail.gmail.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 2:45 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 18/10/2021 10:27, Michael S. Tsirkin wrote:
> > On Mon, Oct 18, 2021 at 09:19:16AM +0200, Laurent Vivier wrote:
> >> Hi,
> >>
> >> I don't understand if there are some issues
> >
> > Gerd did identify some issues, you felt they aren't related to the patch
> > and need to be addressed separately.
> >
> > Gerd posted patches that are supposed to address them since.
> > "try improve native hotplug for pcie root ports"
> > Could you please either
> > - test and report that your series depend on
> >    Gerd's one to now work without the issues.
> >    preferably by reposting a patch that applies on top.
> > - test and report that the functionality is still partially
> >    broken but explain in the commit log that this is not due
> >    to the patch itself, and not made worse.
> >
> > in both cases please CC reviewers: Daniel, Gerd.
> >
>
> I'm writing a test in tests/qtest that tests virtio-net failover, and I've added a test
> that checks the migration doesn't start while the card is not unplugged.
>
> I've run the test on top of current qemu master (where Gerd's series is merged) and the
> problem still exists.

btw, for the records, we have decided to continue to use acpi hotplug
as default and not revert to native for 6.2. So regardless of what
Gerd's patches does, we need to address issues around acpi hotplug if
it exists, for failover.

>
> I will re-send this fix and the test in the same series.
>
> Thanks,
> Laurent
>

