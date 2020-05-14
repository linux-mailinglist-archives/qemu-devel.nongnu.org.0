Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF621D3599
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 17:52:07 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZG9W-00073n-DV
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 11:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jZG8d-0006TY-JD
 for qemu-devel@nongnu.org; Thu, 14 May 2020 11:51:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31558
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jZG8c-0007nn-R3
 for qemu-devel@nongnu.org; Thu, 14 May 2020 11:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589471469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AVroI4fpUHqkJtGVIGseM05A418SO7q/b4oI637ObA=;
 b=LWtw3YRGRkvjbq3pAl8OxE5WMPjy6XDYWuZunVmBecfrlbZv3eXxhYO7zDWi7Zy4xP3TzD
 8cuVAPK106KMTjmIfG4QRliUUKDjamO3hFAhMfCup5Qh0XFHE4VPpACKJ2BEh0Q70xlCNE
 ERrC+foBs0Bf5Set2JW5s2Kh2IPzc04=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-yPA3-cUNMKuCkrA4R1p-gw-1; Thu, 14 May 2020 11:51:05 -0400
X-MC-Unique: yPA3-cUNMKuCkrA4R1p-gw-1
Received: by mail-wm1-f72.google.com with SMTP id o141so3248236wme.0
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 08:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6AVroI4fpUHqkJtGVIGseM05A418SO7q/b4oI637ObA=;
 b=DFXp/o7t01kV8FnuqbE7s8Mo05Cejdxw7aXNURg26rwJ1z2k3hViw4ghYPxJLaRPMp
 n/3jqSirV3mA+OhPBTLg5Sh4s4VSNx+1PyZoJPHpHPzKyt8o2A2OUm1U3ekrWM98ONRf
 5RMpiFwZNJTYW6eCSUau1Othu0yxjxH7KgxbQZWcQXwdA0BWc9fbRvRfEWmFewSrTNBR
 ls32p2+uX44/L+oElaXWZisToZHTWyFOf0iWAH3GYZDXSOB9eUEfjExSB8NyujQvx7+1
 nCG0s4DU+R0s/NQd65RtxVrXpucZwROzu2ilUm0WsAjW1JgVfi2CUAzRW+t0VQ9lmziu
 HPDg==
X-Gm-Message-State: AOAM532r4GyBCxthDR9LT7+0ox+dxph9AXBeYN40ldcWEcJ29Yn0QWCz
 tzRNWPZGwxJX0BT7ajwJM7Date3LFrQV165j+K5j5NLj+CJTR2IwbNV03RzJXYougT9s7od8TGh
 IkF5SCZrZwhR9eAY=
X-Received: by 2002:a05:6000:1045:: with SMTP id
 c5mr5940273wrx.31.1589471463800; 
 Thu, 14 May 2020 08:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCGCLqAoOrOk518sVXyNCjcgkkZXf3S73eVpE2DEU4mdpSn/mp+utGPCQrIfYVUNpopTA5Sw==
X-Received: by 2002:a05:6000:1045:: with SMTP id
 c5mr5940242wrx.31.1589471463526; 
 Thu, 14 May 2020 08:51:03 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.85.171])
 by smtp.gmail.com with ESMTPSA id t7sm4566121wrq.39.2020.05.14.08.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 08:51:02 -0700 (PDT)
Subject: Re: proposal: deprecate -readconfig/-writeconfig
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <7599153e-89a2-9a86-16ad-4a3c6a107b18@redhat.com>
 <20200514085622.GB1280939@redhat.com>
 <56379563-c1f3-3270-f9ac-5bdd49b324aa@redhat.com>
 <20200514153456.GL1280939@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93bda646-6f5f-69b6-57ec-36ec9485e84c@redhat.com>
Date: Thu, 14 May 2020 17:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200514153456.GL1280939@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:41:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/20 17:34, Daniel P. Berrangé wrote:
> Yeah, the key thing is that you really want to be able to provide the
> whole initial config in one go as an atomic action. I don't want to
> issue 100 individual QMP commands to load each initial device.

Why?  I think if we do something like the qemu-vm-$TARGET that you
propose below, there's absolutely no difference between the two.

Then you'd have a

qemu-run /some/file.yaml

(notice the lack of $TARGET) that takes care of starting the VM.

> I tend to think we'd be better served by focusing on introducing a new set
> of binaries,  qemu-vm-$TARGET, which exclusively use a new config syntax,
> free of any legacy baggage present in qemu-system-$TARGET.
> 
> Work on qemu-vm-$TARGET will involve refactoring, and that will certainly
> risk causing bugs in qemu-system-$TARGET. The premise though is that this
> risk is lower, than if we tried to retrofit a new config syuntax directly
> into qemu-system-$TARGET.
> 
> In particular I think it is basically impossible to do any meaningful
> changes in the main() method of softmmu/vl.c, due to the fragile ordering
> for creation of various different devices/backends, and its interaction
> with the argv parsing. By using a new qemu-vm-$TARGET we can have a new
> softmmu/vm.c, instead of vl.c. We'll still likely need to modify parts of
> vl.c to use new/changed API calls, but that's less distruptive, as we
> can leave the crazy logic for ordering of device creation untouched.

Agreed.

Paolo


