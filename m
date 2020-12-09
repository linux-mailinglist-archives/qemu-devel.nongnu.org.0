Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C12D4AFA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:51:53 +0100 (CET)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5V9-0000im-Uq
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn4G8-00073T-Fm
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:32:18 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn4G2-0007Ic-5j
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:32:16 -0500
Received: by mail-wm1-x341.google.com with SMTP id c198so2407742wmd.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ORhm3lwx7IH34F9CgG+1ipqf35s5BA6vDP7NqCNvrIA=;
 b=FZaItdHpYx6ptXa//qmyDoAZvyCndLHWGN4ufZpGRZNmDDUOh8Ri1KXp+NlGVY+ZBw
 7z8ioXQRya78ttWIIsxo12pzYjAl1V8kw5ySgYxslQPe5D1J1wWLPVUZk8QBxApd3jPo
 Elk7xsJ//l++W5sxRqB2oBAtwO7ZMSun+E9qRf1/YzCNDUpZCiko0Z65zMwTvQSvtxX6
 Tam/yjkySabkK9NDyHdRsDNyE5ll4l+CxRB0eK03BGNXARSsaRlrJ2j27SKybCyBOP6z
 IFu/D4pCT2riWHJyXugg/hxyOKe6xggRtbjd2QEkU5r+olpoNpivZ1P7030Zo2yjDOWL
 9Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ORhm3lwx7IH34F9CgG+1ipqf35s5BA6vDP7NqCNvrIA=;
 b=X8FCTscK8m92+4mmU5WBwxsCJZvkv+md2YkzocXo9s6vpythoDcg0o7ubT0o5WEOJa
 e3u3uAtskWWY/YEu1OIWGt+lPj+YnStlsGlMJoYPxfm14pfKeTLaaM3/XRd4665OnjsK
 1jkw3k/7OogYcPgdib5Wxc4ErP9eaMsDdyokmE/9s6DanZpDqhRKXVb5hgJYpWklnjbV
 2CoqGKajPtD7h+v3IM/PCv2VnXRdGJLXk+BjFqA6qL8OOJ0hA+YPNSDiKyG66jMiYC/P
 MXA5Ut03nAAnwb3/7k5Trpm3Qd1ViqHE7kdDFs1+VuyEp8GHA2peCfGIeqqwM1wDUoOV
 oUtA==
X-Gm-Message-State: AOAM532amisVJaZJZL7Kxg/Uesy7B+V2fKQT3ja8tR166vrjhbI7/5xc
 MbjFvetzVn3LYWOvrPU5269alg==
X-Google-Smtp-Source: ABdhPJzevbCAtGLWPRyhO9Fsa7SwHUCRa24GAfYMYZ5Lv75G3XAF07Sx5VzN3cyBkbd2dhMbSHpaJw==
X-Received: by 2002:a1c:67c5:: with SMTP id b188mr4184830wmc.147.1607538725254; 
 Wed, 09 Dec 2020 10:32:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r82sm4851253wma.18.2020.12.09.10.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:32:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26D831FF7E;
 Wed,  9 Dec 2020 18:32:03 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-28-cfontana@suse.de> <87sg8fcf3z.fsf@linaro.org>
 <b9ee5a3a-3160-1e6e-f03b-9dd538e672b6@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 27/32] accel: replace struct CpusAccel with AccelOpsClass
Date: Wed, 09 Dec 2020 18:30:30 +0000
In-reply-to: <b9ee5a3a-3160-1e6e-f03b-9dd538e672b6@suse.de>
Message-ID: <87blf2de58.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 12/9/20 1:54 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> centralize the registration of the cpus.c module
>>> accelerator operations in accel/accel-softmmu.c
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> <snip>
>>> diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
>>> index e335f9f155..38a58ab271 100644
>>> --- a/accel/tcg/tcg-cpus.c
>>> +++ b/accel/tcg/tcg-cpus.c
>>> @@ -35,6 +35,9 @@
>>>  #include "hw/boards.h"
>>>=20=20
>>>  #include "tcg-cpus.h"
>>> +#include "tcg-cpus-mttcg.h"
>>> +#include "tcg-cpus-rr.h"
>>> +#include "tcg-cpus-icount.h"
>>>=20=20
>>>  /* common functionality among all TCG variants */
>>>=20=20
>>> @@ -80,3 +83,43 @@ void tcg_cpus_handle_interrupt(CPUState *cpu, int ma=
sk)
>>>          qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
>>>      }
>>>  }
>>> +
>>> +static void tcg_cpus_ops_init(AccelOpsClass *ops)
>>> +{
>>> +    if (qemu_tcg_mttcg_enabled()) {
>>> +        ops->create_vcpu_thread =3D mttcg_start_vcpu_thread;
>>> +        ops->kick_vcpu_thread =3D mttcg_kick_vcpu_thread;
>>> +        ops->handle_interrupt =3D tcg_cpus_handle_interrupt;
>>> +
>>> +    } else if (icount_enabled()) {
>>> +        ops->create_vcpu_thread =3D rr_start_vcpu_thread;
>>> +        ops->kick_vcpu_thread =3D rr_kick_vcpu_thread;
>>> +        ops->handle_interrupt =3D icount_handle_interrupt;
>>> +        ops->get_virtual_clock =3D icount_get;
>>> +        ops->get_elapsed_ticks =3D icount_get;
>>> +
>>> +    } else {
>>> +        ops->create_vcpu_thread =3D rr_start_vcpu_thread;
>>> +        ops->kick_vcpu_thread =3D rr_kick_vcpu_thread;
>>> +        ops->handle_interrupt =3D tcg_cpus_handle_interrupt;
>>> +    }
>>> +}
>>=20
>> Aren't we going backwards here by having a global function aware of the
>> different accelerator types rather than encapsulating this is the
>> particular accelerator machinery?
>>=20
>> <snip>
>>=20
>
> Now I got your point.
>
> The ideal would be to have three classes. One called tcg-mttcg, one tcg-i=
count, one tcg-rr.
> The problem: backward compatibility I think, since currently we have only=
 one accel, "tcg".
>
> But, hmm maybe fixable, I'll take a look.

Yeah I was wondering if we were going to have subclasses for each "type"
of TCG. But now I'm wondering if that even makes sense. Will we ever
want to built a TCG enabled binary that say doesn't do icount? Maybe
not - having a single AccelOpsClass which runs in 3 modes will probably
do for now.

>
> Thanks!
>
> Claudio


--=20
Alex Benn=C3=A9e

