Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD3940FA0F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:13:58 +0200 (CEST)
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREcn-0000wh-K1
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mREZz-0006wa-SO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:11:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mREZq-0002Lh-8W
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:11:03 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so7484328pji.2
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xmCmavPb7k6mtBYkmkHVuqWXURj9Yuu/cfEWaAz9m6U=;
 b=5sIq/b8YIGwZwISALgDKP+Heef40fonc1VmkT5lP/d5zHJEq72n7I53zib7U7Pjdhm
 XIhvU8yWvr3aGmtAsn3H0rpx8PviTtRrn24kyhCiZhG/jKpOOUtuMn+WRpsP17jvOLaW
 22Xmz9m3lvlluemHWv2t1PyFo8ykRKGVwmtaWG3T0E51DEt2N9FvdfuthP2tTUrAUiGC
 mjEP6ND6vH1624ajQEK5fJ02N3fA45ob6ptk/GLAjK8gCzpMxi/2ciqjnG1fgrQSLaDN
 Gv+WBjg5Y5fXoXo9g8+NWsU4yN22K7OK6J40YARUVBiipg1aiZe0My6oWb1GHI4j0LyY
 9cwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xmCmavPb7k6mtBYkmkHVuqWXURj9Yuu/cfEWaAz9m6U=;
 b=VDBEM61aNPWyUB87wpXNfNQDaU15RVNFu1YYdoy7cKi6fLGfzh8TxvIlA71+jlhNHS
 Xv4av4wcVJ9hHjeTwgxk8MfJy9w8uDE2tnp+8MUhspfpD+DAFIHztuom7SUswR+W5pre
 G8gyVr5Oao1NlIuESKGJBu2AXgM6E9KJ4X24Y1/edJxV32PuyDGv8N1QnaFBuPcmZOa5
 r1CbA5UdyBVB+FWrbM6GI7irpQD/SMUuHYJZLpSmj8dlNdSIeE0D7uz8E12rhxmfCKVy
 cvKLgfupyednSvhL6xVGnA226blZQ6iUbgYGSTepcZVDWoVeYg4sdUBcJtUt0GfiWy7a
 MXYQ==
X-Gm-Message-State: AOAM530BhD92CngRcUnBgMKRPEJD/NREWF0foMBTZHNhqOiWL8sgzrM2
 QyLCUHCRAogbDGmtQU7UqZKitQ==
X-Google-Smtp-Source: ABdhPJxAUiM8FfKMEQCxxdg/FoSOOGJ1Rp3sfpaWCcrRq2ANmmfyz9C+r9qUrJ2TBM1l78nQL++KFw==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr12547448pjo.243.1631887852041; 
 Fri, 17 Sep 2021 07:10:52 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.238.80])
 by smtp.googlemail.com with ESMTPSA id x7sm6652196pfc.71.2021.09.17.07.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:10:51 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 17 Sep 2021 19:40:46 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: Add a unit test to exercize support for ACPI hotplug on
 multifunction bridges in q35
In-Reply-To: <CAARzgwxQyeCEAY1tqX1Pik7N6nnJvfMD+fgetkfHJ2vL7rFs_Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2109171939390.3498555@anisinha-lenovo>
References: <20210906093911.2069140-1-ani@anisinha.ca>
 <CAARzgwxQyeCEAY1tqX1Pik7N6nnJvfMD+fgetkfHJ2vL7rFs_Q@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,
Please do not queue this patchset just as yet. Igor provided some feedback
on the RFC patch related to this. Let me work through his comments.


On Tue, 14 Sep 2021, Ani Sinha wrote:

> Ping
>
> On Mon, Sep 6, 2021 at 15:09 Ani Sinha <ani@anisinha.ca> wrote:
>
> > Hi Igor/Michael :
> >
> > Added a unit test to exercize the following commit :
> >
> > d7346e614f4ec353 ("acpi: x86: pcihp: add support hotplug on multifunction
> > bridges")
> >
> > I had sent just the unit test earlier but since the review is getting
> > delayed, I thought of sending
> > the whole patch set which can be now reviewed in totality.
> >
> > Thanks
> > ani
> >
> >
> >
>

