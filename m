Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7D63488A0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 06:46:41 +0100 (CET)
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPIpL-00064e-Kr
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 01:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPImt-0005cM-Qe
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPImq-0005Qb-Dv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616651041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQtGZT56PnK5QN+Cg74kZq8FM3aJjL6l/6xVKaQz/Kc=;
 b=J6BGq8QoImE4Krn5G5PL0YX6JidVfGo8OHuahQszauxwcjbKaivY7g4QYTswxkOV5+gXmw
 0Ya6nsKpzVuOu2L0NUi5RsfbGzLRfarxKKytTUnckgvZl8/qZzyZGm1mnkaD+K8XDHV5j1
 kAVRf2NUXDTWKdEFjwIvwbX5H4/8Ufc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-s8Kfgas-MEOK2Tm8_yH08Q-1; Thu, 25 Mar 2021 01:43:57 -0400
X-MC-Unique: s8Kfgas-MEOK2Tm8_yH08Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB03A814337;
 Thu, 25 Mar 2021 05:43:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-73.ams2.redhat.com [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21BC88EE0;
 Thu, 25 Mar 2021 05:43:54 +0000 (UTC)
Subject: Re: gitlab-ci: Only build /staging branch?
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
 <8ec8b3b7-12b4-b676-630c-972e7038ec7f@amsat.org>
 <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1a70056b-78b4-c4f4-afc2-044aa499e1c7@redhat.com>
Date: Thu, 25 Mar 2021 06:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <74859ed9-6f93-0b8a-a669-6aef1e164e41@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/2021 22.58, Philippe Mathieu-Daudé wrote:
> On 3/24/21 7:33 PM, Philippe Mathieu-Daudé wrote:
>> On 3/24/21 7:01 PM, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> Peter's current workflow is push to /staging and if his
>>> testing succeeds, he pushes the same commit as /master.
>>>
>>> IMO there is no point in building /master branch, as it
>>> has already been built earlier as /staging.
> 
> Similarly with tags. Although we don't tag often.

Tags are used for pull-requests. So I think we should run the whole CI for 
tags, to make it clear that a pull-request always includes code that builds 
fine.

  Thomas


