Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9541C619
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:53:17 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVa1M-000144-BF
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVZrB-0007TC-U0
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:42:45 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:52738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVZr9-0005Ci-E8
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:42:45 -0400
Received: from [192.168.15.226] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 688AA20779;
 Wed, 29 Sep 2021 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632922959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epcceabITNNYcnI5TMdj4tkfYrUmq6uIZP6EFgA4OC8=;
 b=g2RUB0IxM11tBftY0idIBhv4hWDZ2F5sFvZVFelDrvbDfiD+hRqIB9k87kKYoT0sfFu4Aw
 l039au/MI18oPBOnIEd6i9HDmY8CR+h6f0boex3pUUROcERsRH2AdJY60FP/m6djjQ8njc
 Tf3C8c8a3cjD1as+ZV24uqoDbCO8BJg=
Message-ID: <3a2b391c-df8e-96ef-570e-4dde6002241e@greensocs.com>
Date: Wed, 29 Sep 2021 15:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: QAPI sync meeting
Content-Language: en-US-large
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/27/21 18:55, John Snow wrote:
> Hiya,
> 
> I'd like to propose that at least the three of us arrange a time to have 
> a meeting where we discuss our plans and ideas for QAPI going forward, 
> including rust, python, and golang extensions to the QAPI generator, 
> what we hope to accomplish with those projects, and so on.
> 
> What I am hoping to get out of this for myself is a high-level overview 
> of people's plans for QAPI and to produce some notes on those plans so 
> that I can have a reference that we've all acknowledged as roughly 
> accurate to be able to keep the community's design goals for QAPI in 
> mind as I continue my own development. Ultimately, I'd like some kind of 
> rough draft of a "QAPI roadmap".
> 
> I know there was a rust meetup during KVM Forum, but I was unable to 
> attend due to the timing. I'd like to expand the focus a little more 
> broadly to QAPI in general and discuss our "personal" roadmaps, goals, 
> queued work, etc so that we can collaboratively formulate a broader 
> vision of our work.
> 
> I'm posting to qemu-devel in case anyone else has an interest in this 
> area and would like to eavesdrop or share opinions, but we should 
> probably come up with an agenda first. So:
> 

I would be interested too.

My current topic of interest is somewhat distant (roughly: "remote" 
machine assembly) but I would like to better understand the QAPI roadmap.

--
Damien

