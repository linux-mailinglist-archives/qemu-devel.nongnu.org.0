Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CB72BA54A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 09:57:49 +0100 (CET)
Received: from localhost ([::1]:36018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2Em-0000ls-Ca
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 03:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg2Bq-0007X8-UL
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:54:46 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg2Bo-0002Kc-B5
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:54:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id o21so11796327ejb.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zvfPIZxSxjryua3gC3oViy7jWDenXbe68vN5tY6fqvM=;
 b=MlJd5VPBbVf1dBPm8gNKgydxAcG3zuAZ+fm2hXUWqY2eW7RyerMiztN7VaLrsS+j3m
 envTHRokVY1UGvROaPMjF4Guv9oHrgk17+YQNeminG7ESZ8abV6ZeDWYfNBH0RELukGE
 Gh/ibJqoj3qTKLnrLgVb+skIAG6p2EJLVpGEGz/LYSbJLZzu9y/qh2CsZ6u1H2Io78ka
 FFPmHhpwyWHal7Px5BU/RjlYbPCTopHWJEPHOEGyqt5SXDwV70Z1zmErRFhRLr5kYKwU
 vfqx+b3GjJsHTyMB+OvvYLIoqMmH50N3Iiz/epY3AgddkNNMZWFdoezKJPksCytn9eV3
 QlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zvfPIZxSxjryua3gC3oViy7jWDenXbe68vN5tY6fqvM=;
 b=tgzIQ44XMzUYjDSnqHbAzJDyd1IbKMLiAS8P1OeOW+8fdyOD9WCZdONzlyeNuqY/cY
 XZUHQPcjsV7220uQbVGl9mwzv1L7nBOUEL40L08Q0hSWPC4aMRWX7Dulq7CZwunod5D5
 lExc3bplu2zRI3UwWt2lkuygQHlfrPgc8AHVnu3zwXcicoMLHZHlAQjIAbM9MX7idyYn
 inhzA7CkzrZaut/u/62+tcqNJMZoGqca9jqsndTpUw1DCFvA2kBFwaTwGUdR4pVeuMbK
 mUIDAWv1lrL6Z6qAeNF1ROxSf7c4iDajRfX/1MzVDs5Hcelmve5gD4MHn4mFW7TE6XYd
 VshA==
X-Gm-Message-State: AOAM533oRGMwo5js+Srlgzhr35oa32eWXvW+fLptmysIFZhoUMvHKcZD
 nTh4roKPPdDLUwi/alyzGtW6/11zIlU=
X-Google-Smtp-Source: ABdhPJyNtg/uDzQNG8xfrSf4uS5mBzi9Q2LuINtbOTg0V4N9NRqGmaZBIwD+cXOqZsfJOg0q5QrvEA==
X-Received: by 2002:a17:907:2657:: with SMTP id
 ar23mr14409823ejc.386.1605862482530; 
 Fri, 20 Nov 2020 00:54:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 27sm291316ejy.19.2020.11.20.00.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 00:54:41 -0800 (PST)
Subject: Re: Peter Maydell
To: Liviu Ionescu <ilg@livius.net>, cavinnarsinghani@gmail.com
References: <5A06DC2D-E6A3-4249-B05F-A424D684BD26@gmail.com>
 <1C01B0E2-8730-40F4-8C75-B8FE3E851747@livius.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a0f17e81-5113-2e49-4275-f70674c6edaf@redhat.com>
Date: Fri, 20 Nov 2020 09:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1C01B0E2-8730-40F4-8C75-B8FE3E851747@livius.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 09:44, Liviu Ionescu wrote:
> 
> 
>> On 20 Nov 2020, at 07:43, cavinnarsinghani@gmail.com wrote:
>> 
>> This issue is about the Qemu Will the Qemu work on the new m1
>> macbook pro? And if yes, when will the arm version of Qemu be
>> available for public
> 
> I already distribute a binary version of the xPack QEMU Arm fork
> which runs on Raspberry Pi OS (and most aarch64 Linux distributions),
> and it emulates Cortex-M boards quite fine, so there should be no
> major problems for the mainstream QEMU to run on Apple Silicon.

As far as I understand Apple enforces W^X (a memory region cannot be 
both writable and executable) on ARM hardware.  Richard Henderson and 
Joelle van Dyne are working on it.

Paolo

