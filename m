Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5A257724
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 12:09:49 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCgl2-0002Mf-Ox
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 06:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kCgk7-0001wH-4V
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 06:08:51 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kCgk5-0001SH-CB
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 06:08:50 -0400
Received: by mail-wr1-x441.google.com with SMTP id z4so2530420wrr.4
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=PaJo2AekML3vH8wxeZF3lgNuSHJk2JW1Z/RxRImsIMM=;
 b=0xmhQvehkvCm4VJNXSilTCtAQLJSRXGh48qiMIyrid5EaGS+9DDaDZnwWeofl6yELQ
 K27KIaU54Q3lKRUdbXDBSvsxE2gWzj3ziA2n1/u4noK99Qh30hwocNZJzJkPzmw//Pys
 X3hxHC1tXVWxQbF7077hFPVIqVgxqNgIxjEXS2ZZTHWxBYtFcHW0ZO1xdKfGf0tukgbT
 L9qDGQBashXabppIcOlYWALG+6tdaqvmdYnK/NmftOZYebwJUBCiNTEl8YRL0F4A/dqJ
 oI+xTS7Eduox93czf++LOpiZRfEW7CUZR9Vqg8FGwr+mxIaQziA4n5Tyeb+O4aQT9XvR
 O9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=PaJo2AekML3vH8wxeZF3lgNuSHJk2JW1Z/RxRImsIMM=;
 b=n7QukHB3TC5oi7GC1HLSeEVjZ7X0XtjKttefoeRK3awRLTvnbgs9IYruQPJlvpTlfX
 bstGUc8meu52XWqM8Ga+6tJ40nX122fd5MUepu78A5/XbIQIq2wOsdONfBid7o7Bdp5c
 tLcyOIhIJpIZQTACWOefCbhYprjNXsm3fuDNCwrklGvVjGhtRNkEWG7Bwyzv3Dn0+k8p
 NacbuCwlaRPYVrB8gtIgRr8GE3L4GgfQMEQUZjVQtYEQVAph8HcENfxeZTAx9FZO2jwZ
 Qh4q1QQaDmBigloYj6p9RX40zhPb3rfXbTQjcIQbkSS9z+k2VYuqX7nUo5DBp2V5pxTt
 iobw==
X-Gm-Message-State: AOAM531J6b7E8duG5ZUprYtMzz7Fdnc7jEO0aK7T3kDWczEewheUYM8O
 XBbuz1xG7WXPn1szDKQ1sjkPwrOTlVNYFz/xTFI=
X-Google-Smtp-Source: ABdhPJym8qkFBFUTANnSmzNIEarc6HAdIi4gGyFV2ZV7M37wmT2MeasS8cVL/Yhz15gZ9O0aU2J7zQ==
X-Received: by 2002:a05:6000:1003:: with SMTP id
 a3mr940227wrx.258.1598868527300; 
 Mon, 31 Aug 2020 03:08:47 -0700 (PDT)
Received: from disaster-area.hh.sledj.net
 (8.a.e.d.0.0.0.0.0.0.0.0.4.6.0.0.0.4.1.7.1.7.b.b.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:bb71:7140:64::dea8])
 by smtp.gmail.com with ESMTPSA id z11sm5990657wru.88.2020.08.31.03.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 03:08:46 -0700 (PDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id cdc7963e;
 Mon, 31 Aug 2020 10:08:45 +0000 (UTC)
To: Zheng Chuan <zhengchuan@huawei.com>, quintela@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com, berrange@redhat.com
Subject: Re: [PATCH v6 00/12] *** A Method for evaluating dirty page rate ***
In-Reply-To: <b597768c-eb89-d131-ebf4-5a82bcf1e326@huawei.com>
References: <1598669577-76914-1-git-send-email-zhengchuan@huawei.com>
 <m2h7sjchid.fsf@dme.org> <b597768c-eb89-d131-ebf4-5a82bcf1e326@huawei.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Mon, 31 Aug 2020 11:08:45 +0100
Message-ID: <m2k0xfb00i.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::441;
 envelope-from=dme@dme.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 zhang.zhanghailiang@huawei.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2020-08-31 at 17:55:39 +08, Zheng Chuan wrote:

> On 2020/8/31 17:05, David Edmondson wrote:
>> Trying to think like a control plane developer and user (of which I am
>> neither) raised some questions about the overall interface provided
>> here. If everyone else is happy with the current interface, then I'll
>> shut up :-)
>> 
>> It seems like it should be possible to query the last measured dirty
>> rate at any time. In particular, it should be possible to query the
>> value before any rate has been measured (either returning an error, or
>> if that is unpalatable perhaps a result with a zero interval to indicate
>> "this data isn't useful"), but also *during* a subsequent measurement
>> period.
>> 
> Hi, Thank you for your review.
>
> For now,
> i. if we query the value before any rate has been measured, it will return unstarted,
>    and dirtyrate will return -1.
> {"return":{"status":"unstarted","dirty-rate":-1,"start-time":0,"calc-time":0},"id":"libvirt-14"}
>
> ii.if we specify the measurement interval like -1 or 61, it will return error
> {"id":"libvirt-13","error":{"class":"GenericError","desc":"calc-time is out of range[1, 60]."}}
>
> iii. We can query the last measured dirty rate at any time now as you expected in last patch version
>      with returning the measurement timestamp and calc-time.
>
> If i have missed some other scenes, please let me know:)

No, I think that you have everything. My aim was to see if other people
agreed with the usage scenarios.

>> That is, the result of the previous measurement should always be
>> available on demand and a measurement becomes "current" when it
>> completes.
>> 
>> Given that we allow the caller to specify the measurement interval, some
>> callers might specify a long period. As only one measurement can be
>> taken at a time, a long running measurement rules out taking a short
>> measurement. That's probably okay, but does lead me to wonder whether
>> the API should include a mechanism allowing the cancellation of an
>> in-progress measurement.
>
> That's why we restrict the maximum time to 60s, i think this is enough and also
> not too long for user to observe the average dirty rate.
> I think it is may a little expensive and hardly used to implement cancellation mechanism.
>
> On the other hand, users could call several times with the measurement interval
> like 1s, to improve its accuracy otherwise observe a long time.

Understood.

dme.
-- 
Modern people tend to dance.

