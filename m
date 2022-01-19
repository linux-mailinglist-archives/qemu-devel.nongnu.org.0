Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665F493737
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:27:23 +0100 (CET)
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7FS-0000z1-BD
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6XK-0003Aa-VB
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:41:49 -0500
Received: from [2a00:1450:4864:20::330] (port=53964
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6XI-0002M2-SI
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:41:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id n8so3750380wmk.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pr0SJuJbIu9TCcjc1scSAGjQFmCj/kK5gai1/6RvXjY=;
 b=cF4j0mEln6ZBQQuCH/ZHa+iLaBzG5vcswyOcMl/JxbA6mHR7A3nHXIfmd4r1SvZh6W
 dLp9KS502yJt4B1pWOtV9awrpQFL9xtypVBUZ20nEOaDJG4I54gNG8waQrcggYp94NeA
 kj0ADc5gWj9PGyZGjELXZVwjUB5LSlpsZDEgrULyj5ZRLW/dcfsAIx+Wb4FdQUqrV4Hy
 GYdaf/MkRYs9O2aPhTT2VSH/TRwwc255Q9bdc5o8wfASzsy7JNShI1QhO+291JLu5y2Z
 LfHlT2bY2Wa1z2eE58GZvNSAtSxaCS+pweNXQQ9P6UiBzY5kwwogfxXLOBaHUI7IKjQ/
 +V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pr0SJuJbIu9TCcjc1scSAGjQFmCj/kK5gai1/6RvXjY=;
 b=jtyMff61xaDZqn9HjJ76uVZt9V9bzmnaHX4Tbbxf3wQpzCaZWt1VCa2Xd2qGzyAp8U
 2GgoiC3nNi/5/YYZCKgUQVUXfpzVLEAHv2TckpfCTO0+TuRWyTE9yj89p0SLkFRKwH6g
 bWMUZD286NQ25HdH80q8dCr+PolUT4Vq9jnHnDSkase+gzG7UTmNhfSel1p5/wfzpnm5
 y2aYX3xZjFWJxgXWMfUIk+pxcuZQkhcdKCI5FVjmyRyywx17ZthCwoITAfeIWF6NzTxs
 DXhRRBgCYM2CgULaO6zs10rQHmbDOa8xjxIab+TYsmsFRcVx9e+JIK199RshB75z8Z8b
 gLiw==
X-Gm-Message-State: AOAM531BwJmY2luFUNs1j38aieQAxN6IVJ5n1YPo7OVaBfXosTBlBkoE
 djm3ipk2T3KUGESj1uvhlWs=
X-Google-Smtp-Source: ABdhPJzmuCxX1Dg3Ieu/2uXzg5SQBav8ZlWCzJRItQqVcET0lgMzhzJZM5efJPRxS6iOCiMs3ks5fQ==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr2350830wmi.181.1642581702721; 
 Wed, 19 Jan 2022 00:41:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id i8sm11472261wry.33.2022.01.19.00.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:41:42 -0800 (PST)
Message-ID: <4938a29f-a4a2-2a2e-990c-90789a1e8090@redhat.com>
Date: Wed, 19 Jan 2022 09:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/3] scripts/qapi-gen.py: add --add-trace-events option
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-3-vsementsov@virtuozzo.com>
 <877daxpcdz.fsf@dusky.pond.sub.org>
 <69e04ac6-8bfb-5d66-fa99-fcdf8340935a@virtuozzo.com>
 <87zgnt86ow.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87zgnt86ow.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 15:22, Markus Armbruster wrote:
>> So, supporting auto-generated trace points for qga qmp commands requires some deeper refactoring.
> Similar trouble with tests?
> 
> The normal case seems to be "generate trace code", with an exception for
> cases where our build system defeats that.  Agree?

More specifically, it's the lack of "include" statements: the only kind 
of include statement allowed by Meson is "include('foo/meson.build')" 
which is actually spelled "subdir('foo')".

What this would require is akin to

	include('qga/meson.qapi.build')
	include('tests/qapi/meson.qapi.build')
	include('trace/meson.build')
	...
	include('qga/meson.build')

There has been an issue open in Meson forever about this: 
https://github.com/mesonbuild/meson/issues/375.  Some discussion can be 
found in https://github.com/mesonbuild/meson/pull/5209.

A somewhat ugly workaround would be something like

	subdir('qga/qapi')
	subdir('qapi')
	subdir('trace')
	...
	subdir('qga')

Or even, move the .json files for qemu-ga and tests to qapi/qga and 
qapi/tests respectively.

That said, given that there's no tracing support in either trace nor in 
qemu-ga, I agree with Vladimir's assessment that there is no reason to 
do it.

Paolo



> If yes, I'd prefer to default to "generate trace code", and have an
> option to suppress it, with suitable TODO comment(s) explaining why.

