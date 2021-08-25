Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352783F70B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:53:49 +0200 (CEST)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInjI-00053Z-AD
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIniQ-0004Mp-99
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIniN-0002EO-Uu
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629877970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HDXkETihHt5uJ29wT3mifhPqLW+/UhXdLPPmD830lDk=;
 b=FVc6XIRwvAy09sHjWPqBvWMJr4DN5ZMoc//oPtA4b4AWG9cf4SxxrGvErCArKgFVs2kd+j
 DWeHh+gHM/28/hNPJ5m0KqrkPuIiaMYe7qktXxO0cOuFGPuLajT85X6YNf5hKb1PGdSXXW
 Ua7stOtP14PC9+74zBH5uluFCB+Vxt0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-qnzAlohPPcunBnmnGzlsiQ-1; Wed, 25 Aug 2021 03:52:47 -0400
X-MC-Unique: qnzAlohPPcunBnmnGzlsiQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so1639514wmr.9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 00:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=HDXkETihHt5uJ29wT3mifhPqLW+/UhXdLPPmD830lDk=;
 b=mFOQXYIpG5fNLVF1iG/18W0SAyunq2WssQJfubm6o5tjSzDpW8osGg6ovOtud1/qX3
 JzVAxmc2x3wGgduTiv/ukbwo60q3yip0/IDSJRsu8YuXpRZSER0srtbiWCNRR1evRW7f
 luwIfcOEso+xkupKTOGEgD/hhyyZFsvW83krTi8vWwWTyh78AazMbKh0AJbgBHhwfVs9
 QbzBMagRgBVjdyy9iGiwdY1v2ycdE8Jky//ckJLkifQB5DKTDa2gsRPvqv1UIR78uhS1
 iCo1zqg4eihnmwExXC2A4fo3Red8KCkIWTkIgBT73MSeetmYpbt+YLOEauAkXwYFIOmM
 KWZg==
X-Gm-Message-State: AOAM530EspkDOwJIVJTGV9kOLIqSb+PDzeU+hErcFJ3t4dxAZF3ep3Fm
 +zQ6mw2Y20b3blVRMzHysmT+n+zRfoBWWhVr2GHKDC9bitq308BaeLzlMoQaPIehsMhm/29y8zG
 poGZUAyvvXxumMtcWnLNHx2W5MpD75zkUCh2LW+90/D6Zmi/XG0l3ju1vhRlrtHA=
X-Received: by 2002:adf:ded1:: with SMTP id i17mr23124735wrn.303.1629877966378; 
 Wed, 25 Aug 2021 00:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWFRpds9rjzN1xtA6ogQf9olmOL6U3SZ8wluJJPFmiuNCuy5yfOUKxEB2nUfGw3/MCbivaQw==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr23124709wrn.303.1629877966063; 
 Wed, 25 Aug 2021 00:52:46 -0700 (PDT)
Received: from thuth.remote.csb (p5791d776.dip0.t-ipconnect.de.
 [87.145.215.118])
 by smtp.gmail.com with ESMTPSA id w18sm21847087wrg.68.2021.08.25.00.52.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 00:52:45 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU's Launchpad tracker is now closed down
Message-ID: <8be31c2b-326b-32a8-a83c-0da4c3dc6757@redhat.com>
Date: Wed, 25 Aug 2021 09:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi all,

almost everybody is using the new Gitlab issue tracker 
(https://gitlab.com/qemu-project/qemu/-/issues) already, which is really 
great, but just to make it official: The QEMU Launchpad tracker 
(https://bugs.launchpad.net/qemu) is now discontinued and should not be used 
anymore. At least I will stop looking at the tickets there now. After QEMU 
6.1 has just been released, I now either closed the remaining tickets as 
"Fix released" or moved the non-resolved stragglers over to the gitlab issue 
tracker (there are three tickets left on Launchpad, which however are likely 
going to simply expire if nobody speaks up).

Note that notifications for the new Gitlab issue tracker are not sent to the 
mailing list anymore. If you are interesting, I strongly recommend to enable 
the notifications for the tracker in your gitlab account instead.

  Thanks,
   Thomas


