Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB8300050
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:32:32 +0100 (CET)
Received: from localhost ([::1]:39718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tjz-0005JA-W0
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2ti4-0004RJ-RT
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2thy-0007WQ-Fj
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611311425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu+UtV9Rnua0VDUQy/2chMVsaCrd4P8GlRykSUBZ++8=;
 b=Lb4r16VNe2Dm+EbdKPTH249draUVWYXEOoOL2Pv3GPRV6gm61NWO84Hac3TG4aDXey0WTz
 cD+LzKN13rlZ0jw86xwAhGgjnOGQdIQgh0yyTZuuLhIcvTpllSmAgjmDQ2Ul8GNjb4bkQA
 n9Wyqj7Gz63GdYfQFIwbxS1f86JEmN8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-QhRz_d6dMqG-n7K4wkV0Jg-1; Fri, 22 Jan 2021 05:30:21 -0500
X-MC-Unique: QhRz_d6dMqG-n7K4wkV0Jg-1
Received: by mail-ed1-f69.google.com with SMTP id 32so2690006edy.22
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qu+UtV9Rnua0VDUQy/2chMVsaCrd4P8GlRykSUBZ++8=;
 b=Qwm6xQ8hecFwGLZsasBL/35Kaxl1RXpaAMnas2AIDtl0MpiEHrhuVBCsQPT3DrTVfl
 N9mOTWiF5DWY62LR9fSf7LjvWaEI/tosfToEZ+ZBRPagGV1dPlhb/5qllHrTghXtmXCO
 7whNurs2yAcsbP1xxU1wwaywhOBGp8VPgfnz/DtWFe7c/aqB/GVXVmjc0Zbyu9J0YzEv
 kivKvDW0dCvndG/0WewOYbTRLmuz71VPIM9QSSSltPsFXiqMXv1v8XpNbrpX4zVq7B3o
 Mg85+ud0MTMiWSvTA5e5HhkC5Vx9MBtWY1SJal3C8raDCS5AaJA6IKt1CdHX070qla7p
 xsGQ==
X-Gm-Message-State: AOAM533pI3VQ6j97ApWBwD9upuBWA1i6K/7F5F6oSMm+B+sWYTedd2CA
 h9rsnlZt+6QHv6L1AtbgoOzgck53Xfml2YuY+K+kX+O9Kj7OwG+Cojga+IOI5IyvRq5w+/EVgwQ
 RTKddQbJaV8tlz58=
X-Received: by 2002:a17:906:1302:: with SMTP id
 w2mr2677360ejb.413.1611311420176; 
 Fri, 22 Jan 2021 02:30:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX9mtfGBcSTW6r7SOqufEhhgR6dhRcQqcQkwqA9pOcPF1/Pbx0Ssmhjqli6/tRq92KtnEf+w==
X-Received: by 2002:a17:906:1302:: with SMTP id
 w2mr2677349ejb.413.1611311420041; 
 Fri, 22 Jan 2021 02:30:20 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m20sm5329651edj.43.2021.01.22.02.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 02:30:19 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci.yml: Use the whole tree as artifacts to speed
 up the CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210122100722.705375-1-thuth@redhat.com>
 <20210122101833.GC3150238@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9e0568fe-3547-aab2-261c-a10d7cdbca6e@redhat.com>
Date: Fri, 22 Jan 2021 11:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122101833.GC3150238@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 11:18 AM, Daniel P. Berrangé wrote:
> On Fri, Jan 22, 2021 at 11:07:22AM +0100, Thomas Huth wrote:
>> Currently, our check-system-* jobs are recompiling the whole sources
>> again. This happens due to the fact that the jobs are checking out
>> the whole source tree and required submodules again, and only try
>> to use the "build" directory with the binaries and object files
>> as an artifact from the previous stage - which simply does not work
>> anymore (with the current version of meson). Due to some changed
>> time stamps, meson is always trying to rebuild the whole tree.
> 
> This used to work in the past didn't it ? Did something change in
> meson to break this, or have we just not noticed before.

Likely https://github.com/mesonbuild/meson/pull/7900/

Kludge:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05491.html


