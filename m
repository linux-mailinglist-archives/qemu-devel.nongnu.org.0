Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609184732F6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 18:32:23 +0100 (CET)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwpBU-0004Xk-Cy
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 12:32:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mwpA4-0003c6-Rk
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:30:52 -0500
Received: from [2a00:1450:4864:20::535] (port=35750
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mwpA2-0004Ig-UZ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:30:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id v1so54979885edx.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 09:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hOPBvxkeM8LIFL+RjAftmhTG2aUL2+d7a5KnwPqBrFU=;
 b=LWBuYRP5bfZk+7xWtz2rQUR5UITYnPxYP8rj3XCWJkEnto60rJeneRNsNRkz6eVvcW
 RAHvuwf/CKd16Gm04CYP2TElFoEcGvJNJfAPHi+sL43p7uf42RTc5Uz8ohkzSTzl6qcb
 zaew50vDUlAdcDcbuUp+sW8FopsCJi1mQ0p6To5C0inAXkDJFvE0te7ZEH4PMZAtOLFQ
 vDIoFmesAvnBE9r/doeyrSmt3//q4g4YfFN8JX9I4y5Fwn9PiOtpnB9bhFblzQWpxFIB
 P0S3sXVZSRu2uH1bePOMtZZdUGtJ8ArkPFfI04qApd+qmE7AySNxL4lsHTGJD7lrBuof
 CDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hOPBvxkeM8LIFL+RjAftmhTG2aUL2+d7a5KnwPqBrFU=;
 b=7oXcT2YUcUKqbe2u25YKV9u73+yXuR4fK2qN5MwVbaxLNyGik17+uUPBqa1uEk6Q1m
 brF6RnlfyV2PgyFDHzd+bRpqx0iASgnTsPaCRttozl4rQsEKstqnMQKAs+SGZslcXXG2
 QHjuRuvbenKvfWpHo4oTP7k4ynnjvUiOGZj4xzCZ6wOeMVYr6EP5F6za5Y9f6vOs05e1
 Dn+kzvzozSTCFx5Vu6K0QyOekQaYv0F3soMGAOJYsURmEg1gseavY+8KKzp2vRVlpdTV
 MtK1n7Y7W7IPmUbEdHTTi4PJjxU6ZhvviHzVFACPYZtOxE06I8xYOdGTRdsFwxSxj1VG
 PYHw==
X-Gm-Message-State: AOAM530SmjsCSmByyIPAwZWHCTQfS3/7eSq8FtvnuNJrbqisrGapyVbW
 uiCz2GBJVtj8m6F+/NMpWjw=
X-Google-Smtp-Source: ABdhPJxI8127R7a1Rrqou/8Q/+qBI3r80r51I5qFyzR63uC0MSZU/62F3nsvY9DI/UFiegMbdUWimA==
X-Received: by 2002:a05:6402:1450:: with SMTP id
 d16mr190385edx.144.1639416647970; 
 Mon, 13 Dec 2021 09:30:47 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id r24sm6558486edv.18.2021.12.13.09.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 09:30:47 -0800 (PST)
Message-ID: <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
Date: Mon, 13 Dec 2021 18:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ilvszg52.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 16:19, Markus Armbruster wrote:
> I think it's more often just three: the long one that can do everything,
> the short one that can do simple things (and doesn't tell you anything
> about the long one), and the bad one you shouldn't use.
> 
>> If we're going to have a good CLI, it would ideally only have
>> one way to do each given task.
> Ideally, the long one plus good defaults suffices.

That's hard to do, because the short one typically creates both a 
backend and a frontend.  It should be possible to macro-expand into the 
long one + a -machine property, but that's extremely tedious work.

Paolo

> When we must also have a short one, it should macro-expand into long
> one(s), and the user should be able to see the expansion.
> 


