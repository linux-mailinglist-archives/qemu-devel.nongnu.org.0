Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8D3A82A9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:22:54 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9xt-0004wQ-2G
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9Ym-0001y5-G5
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9Yh-0004rI-U3
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623765411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZw25nC33y6wLsb1Hesy8UZt2QCbZvlpabZ/ioufbhQ=;
 b=A9bxf0A49e54GqlfozRAJW/te7RRzNIokQaydt84GS1popCUsSyUpokVZxGjTjhiwOZ9Rp
 ECXeodIqWCymXIXIBisFLSbHnqKws93kiUlV6EHtnu5qoR9ANLQwiMDEW/+zsFjKK1Jmnv
 CiBKTCIE6cuITI4Eh6t9yVn3C4RfPw0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-PxtG5RdRPim3OAlYRTvrew-1; Tue, 15 Jun 2021 09:56:50 -0400
X-MC-Unique: PxtG5RdRPim3OAlYRTvrew-1
Received: by mail-wr1-f71.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so8621668wrm.17
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lZw25nC33y6wLsb1Hesy8UZt2QCbZvlpabZ/ioufbhQ=;
 b=CdBvsLPOuUlZSZRjIq+76RjzdXL8pLGnWeV++w02DiH7eZNSUK06RV8UGjLbYb+I5H
 hxbZR5160FM5hB4lEM5AYsOG/kyHaHag7MsiwNSqwmMVqBG6ou33MuIWzM6OOAvYPfPY
 XFsDou9UB7NskNhADYQxdJnd9smxGHaKyi/bvv81IBhfuZgicRirLod+Ir2974LVLUMy
 vbuRfvtzFa1JuDFxsx/CCzgyjWfoFm0LJSfPba4tPPkzU6Lyu/KcHrdaLS76X7wTkftx
 FypnxpskOm6bG5Acu3D9kBlU64VWwbCcyLHYnlD+HuEbf6/b+T9d9MWpWKBbt7JgQ6PV
 SNFw==
X-Gm-Message-State: AOAM532X5dtQc/5pXyDB/LNqtNSRjXuFfVMUfeaWGD/Qk/zPifA8gFVb
 N+2GQFGf9+auyA2vCgXulSqS6jDaSzWx5UjIi4JCSPT29CQ+TxlLpQFBcx+KNjUmKHcb6pLY4GY
 Wb6Wxyi3WzlFn33M=
X-Received: by 2002:adf:efc3:: with SMTP id i3mr25354919wrp.356.1623765409081; 
 Tue, 15 Jun 2021 06:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwezGeonm4dQkhrug36xJVi7tQcpGRKp/bWNM+RELp5PHKQli6WnJfdeQrUtm4ihMsjD59Ecg==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr25354879wrp.356.1623765408894; 
 Tue, 15 Jun 2021 06:56:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y26sm15669181wma.33.2021.06.15.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:56:48 -0700 (PDT)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <YMgLha7YL8XYrShS@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <88526829-d341-6e72-2bde-7694835599b7@redhat.com>
Date: Tue, 15 Jun 2021 15:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMgLha7YL8XYrShS@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 4:08 AM, David Gibson wrote:
> On Mon, Jun 14, 2021 at 01:32:11PM -0400, John Snow wrote:
> In general, what's the convention when a bug is independent of (say)
> the accel: does it get none of the accel tags, or all of them?
> Likewise with OS and the other categories.

None: remove the label. Otherwise you'll notify everybody subscribed
to specific labels.

>> We probably want to keep a set of labels that apply to the host
>> architecture. These are useful for build failures, environment setup issues,
>> or just documenting the exact environment on which an issue was observed.
> 
> Ah.. that's another general question.  Are the labels supposed to
> document where the problem has been definitely observed, or a best
> estimate at where it will appear.  It would be very common for a bug
> to be observed initially on only one, but quickly turn out to be
> independent of host and/or target arch.

Similar. If the problem is generic, remove the specific labels.

Regards,

Phil.


