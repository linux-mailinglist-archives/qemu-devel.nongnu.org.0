Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D529340E9F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:54:41 +0100 (CET)
Received: from localhost ([::1]:38364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMyjA-0001pB-IN
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMyhQ-00017d-4J
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMyhO-0002cV-N7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616097169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRKrk0uqJhvi6onVEPXF/gUuEZG2ykiPrVykaIV4/kI=;
 b=I9P6DphQnrbgCkwmPWfuYAQ5LqJ9u+WMYxAZHFUaYIHhlVpjM232EzSpSrKnzroCBoiDRq
 KKehZos8OKoNvoo5fi5QOasUzAYaiQ+U5w5sfYmf6Q4wdeuj3FjNRLd6UPYgT0nDKcoP7F
 4KHEWti+tU9uhGQhwl8yBjTiRbW4bRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-aU5SRpVfP8GpydU8cJw-Lw-1; Thu, 18 Mar 2021 15:52:47 -0400
X-MC-Unique: aU5SRpVfP8GpydU8cJw-Lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9D07107ACCA;
 Thu, 18 Mar 2021 19:52:46 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36FBD60CD7;
 Thu, 18 Mar 2021 19:52:42 +0000 (UTC)
Subject: Re: Serious doubts about Gitlab CI
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <a4bf6d0c-e66d-1b57-edfe-b02c71c629da@redhat.com>
Date: Thu, 18 Mar 2021 15:52:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 3:46 PM, Stefan Hajnoczi wrote:
> On Wed, Mar 17, 2021 at 09:29:32PM +0100, Philippe Mathieu-Daudé wrote:
>> Now I'm having serious doubts about Gitlab usefulness for the QEMU
>> community...
> 
> The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
> GitLab Merge Requests so that anyone can submit a merge request and get
> CI coverage.
> 

How does this workflow work?

I push to my branch, I submit a MR, CI runs?

I suppose there must be a way for me to disable a CI run on my branch if 
I intend to trigger it via a MR, to avoid eating minutes twice.

--js

> I think we need to expect free tiers to be insufficient for full CI
> coverage. In the longer term we probably need to rely on dedicated
> runners, although I'm not sure how much of the issue is QEMU's huge CI
> pipeline versus the performance limitations of shared runners.
> 
> Stefan
> 


