Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9554761CB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:34:22 +0100 (CET)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxa2f-0002SS-HQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:34:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxZIY-0000GW-Vq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:46:43 -0500
Received: from [2a00:1450:4864:20::534] (port=37672
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxZIX-0007Pr-3p
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:46:42 -0500
Received: by mail-ed1-x534.google.com with SMTP id e3so79184368edu.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7986mY5DoME2u0dDt9x/arEfZOAf/MhvHDHfqT7eUig=;
 b=QqHOF/AXDwtICB0dRGuTZUF1OAtOO5/xLuxqG5NNxcLokAAjIANLflhGDR32w7gDb6
 KrPXJWIc7HF25RXaoAJdTwNmqvQcFZa+m7pjnXD+Hicif8DxU/8zQnoq7mhjvLmW3FCx
 7snbwKYSldQGcKzr2pV5rSXCUXZAlNhZXKp8OKQharivzQo4nKB9rf3If5/yiMXNiMmt
 SMVxJ+AXqa16ItenMwQ7D76+eX8aGUyLKbUaqPZfpWXSy9oox/Op+H6G8uXBoD2y3N5A
 iGau+c0MYMpajIewg2CsmeYB5guBvF8hTP5DVkwN3qsQyTsojjtClsRXEiWYTi1jvaro
 6jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7986mY5DoME2u0dDt9x/arEfZOAf/MhvHDHfqT7eUig=;
 b=gunPHwRAx9xWLRRhn+yTawBKAGozdFUjjfouKKQR2W8RuPsz2E9Eb+Om+/0ffFpRKj
 MzOmgIYPStOXfcPYNzA6MfDINmTiJC1b2NHG8PfzfOYaE6AyBn811yABoZIOakvCynde
 og224D0pEja+FB/iIXDMErQI6+wavukW3+y57hvFV2Y/cr+9MB5lzpzD2UdAKslt1HTC
 wGj5aERBte8mbTQe+fQek8M33ePT21JVKdCLvUJW28AKfGjnFhlGHfmgF8dVMKl0/ie1
 NAR2uI7dTTqCa4j7V5bytK8/0MOHdAqi3i/lKf3JqK0ccdKtFtxmMK4h/TCc2yQo2BZ6
 5Cdw==
X-Gm-Message-State: AOAM5305E9kEt7/c5LacOy0Cp7OB/NmzGExGxjNbQxdg2K6vr37Di0wT
 CfAyq7Y+svmzl3k/fsS/K7o=
X-Google-Smtp-Source: ABdhPJyl41lW2SIffn4fwqGRh33xsYW+o8QpcNJ+2sDMa5OeyfMBA5Bi7G0RJCdfXVz3h7XZu2uGBw==
X-Received: by 2002:a17:907:248a:: with SMTP id
 zg10mr12104005ejb.749.1639593998913; 
 Wed, 15 Dec 2021 10:46:38 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312::9ea? ([2001:b07:6468:f312::9ea])
 by smtp.googlemail.com with ESMTPSA id 13sm1003364ejj.222.2021.12.15.10.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 10:46:38 -0800 (PST)
Message-ID: <26f9bac3-07a2-6152-94e9-596426616f55@redhat.com>
Date: Wed, 15 Dec 2021 19:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YbeWxAn6Zw7rH+5K@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
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
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 19:53, Daniel P. Berrangé wrote:
>> Adding vhost-user backends and helper processes means one of two things:
>> either you are not going to support hotplug, or you are going to redo
>> libvirtd with a QMP-based RPC.
> 
> If it were possible to keep auto-spawning of helpers at the high level
> that feels cleaner, so that the low level only has to worry about a
> single way of doing things. If that is too hard for hotplug though,
> so be it, leave auto-spawning in the low level.

OTOH, autospawning in the low-level saves hotplugging but it kills 
sandboxing; the seccomp filter prohibits forking.

The libvirt model is the only good one once you care about separation of 
privilege.  The idea of moving large parts of libvirt's domain driver 
into a new QEMU-level binary was floated around in the past by Andrea 
Bolognani, and I don't dislike it; but I don't believe anybody will have 
time to actually realize it, much less to bring it to feature parity.

Paolo

