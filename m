Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FA4992C5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:27:37 +0100 (CET)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5w9-0002OO-0P
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:27:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nC5jj-0004qE-6L
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:14:48 -0500
Received: from [2a00:1450:4864:20::42f] (port=33401
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nC5jh-0002oR-Fp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:14:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e8so13970686wrc.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PP0l6EbTBJ/XLv5n2hco0SKMEJvAmiyFDIWhkJmZ8Ms=;
 b=xsKytF650y5B4ntXSGr/WwwWUwHg1xWTWpkNqVm7OJTLMueCkAtWmwY8s9c1OFtKRM
 MbHkvzTZOVELkji1b5/Qqrg+jweDh9wyzBoMJ52IWqqNirHdwE2bh0j+AQ3oaPSbJk7J
 9VF7eXgGWO5vGFKSxcbJkQFegj6msdT3b6znXDGIo6XtPe8J6u9OzPUgbD2gUYjNFgUv
 lX87dY4Emx0gcv+kWTHb3sTFd5XFAR0d3RtUCwHGvHSQ00JXkeT3cNkdcOBcUV5Q7/Vw
 3X3T/FEJoRnwBHD5OzU1s4t3Cs0alXns1q6sR9lDHo43D0M+KyjJyiR41NNC3wqaSXWx
 3YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PP0l6EbTBJ/XLv5n2hco0SKMEJvAmiyFDIWhkJmZ8Ms=;
 b=wLodiW4MrCRuX+7V4SGbrkIHK2C5/sJaVnfTdva3zB3cVnaspNrl7MGD7Rxx7kHNrf
 CWV0Y960KDCdQ2/gbtf6HpEbeqOI3vV0QbVAc6viy1EM8MQDpUUIG1ux/yqhGmXtyT5A
 vHj0rZRmPaAx+cBBaAxhqeA3JaqnO+7g3+Kj3KNPJibIYrbrMnSOsycjWpORWsn5aiMz
 PvRLSrdhFsM4dIxiGOURLlnUSC0o5Ioda8RhqjpzH1EMRvwlTybPJoqHZjlCsYpu+v/1
 0h5BYrmEpSiSUA4QMJkmvwbRLaTgW588x27hQO3qfKNhmTm1dttGCkOryCHrDRsGKPoX
 A76g==
X-Gm-Message-State: AOAM533/TP+yAgEGR4DWFdLN25R+kt3fOgg4tKiE+BsakeOimKCDbyz9
 hwra6LOafn+Q6Gut3R7YrRJz8qJYy4iYdP83JqQ4yA==
X-Google-Smtp-Source: ABdhPJz0tbeJftWZF+SziWNdUCtdO39gsbmdMoFyAbtlhjflVeRpFw66kb6b9UsSV2AHpJ2Iqa8nq0ZwX2EupF9zBmU=
X-Received: by 2002:a05:6000:1d87:: with SMTP id
 bk7mr15815762wrb.2.1643055283335; 
 Mon, 24 Jan 2022 12:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev>
 <7053351.4JHWUSIRgT@silver> <Ye7mwcl/rB714vgl@roolebo.dev>
In-Reply-To: <Ye7mwcl/rB714vgl@roolebo.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jan 2022 20:14:31 +0000
Message-ID: <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Roman Bolshakov <roman@roolebo.dev>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 phillip.ennen@gmail.com, jasowang@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 dirty@apple.com, armbru@redhat.com, r.bolshakov@yadro.com, agraf@csgraf.de,
 kraxel@redhat.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 alex.bennee@linaro.org, eblake@redhat.com, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Jan 2022 at 17:49, Roman Bolshakov <roman@roolebo.dev> wrote:
> I'm not sure why blocks are Objective-C specific. All the data I have
> shows the opposite [3][4][5]. They're just extensively used in Apple APIs.

This is true, but for the purposes of our build machinery it is
simpler to have three types of source files that it deals
with (C, C++, ObjC) rather than four (C, C++, ObjC, C-that-uses-blocks).
So unless there's a clear benefit from adding the extra category
I think we should do the simple thing and keep these files named
with a ".m" extension.

thanks
-- PMM

