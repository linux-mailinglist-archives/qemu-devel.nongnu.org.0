Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBD65E6AA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 09:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDLRQ-0000od-SS; Thu, 05 Jan 2023 03:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pDLRO-0000oJ-Et
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:17:34 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pDLRM-00083H-Ej
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:17:34 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id t17so15049275qvw.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:user-agent:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=ZAxx1lRHqKF6eo5b06SH2RM/rKcZq7sz+7C/uDEloGE=;
 b=0dvKg3W9AAN19JIX8kEJ1olUqIAv81dx4cjyy2rOggBbP2TecxGIrQqTrU9OeFHMGr
 82uwsLIJrhIIT4YJ1vPxh91yfzy+xqWGjpmHibmqIywkVpwys3l5TV1DcF7bF66xoTWA
 u90tQvT12tNuQqsu2jKtAAj+kBeKFqHg1rJzZ8qSdrHRX1JPwgbBXsQSf/vewnUyDYSV
 Cj8xsfSuOAf1eaqHK2mkyRbECQhYB0aF4iVxPXSiiynugGGfvEKtLdrL4IT5PrUqlazh
 JXmdsM36rRv3FilBFmmX09yLu7PjNgQs01Zfj8UwAFoGW22ZgWD/o+gfL2rRXbWs754i
 xzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:user-agent:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAxx1lRHqKF6eo5b06SH2RM/rKcZq7sz+7C/uDEloGE=;
 b=GtjAVznST1FTCo92s2RIaTl5w73ZA7FW7wimvFRvTqZKM7BiggMdIH4Hd5YKilR4nj
 /gIUzVdCQyTnjOL1w+v5T+c3HUH6OWR+8I0Nhmvi7cHOz7RnKbzilOQkBXTv7rNYaT6v
 h8Abis/RC54X2rlBMRQI50L4IgbAkyNrNMB659U9zJyk4aiBs6hHg+2Em65JqpJNUkCK
 yhJws/JZnA5N2S/Mc4Oqrj7w+0lc1JATwcDscRSafalQgaZF3K4Bd9CfLrjoa9fkRKp6
 7C731J02QtHbe+/klkTdk+9cKmloFyAkHv3CvZVxQuBtUr60QD00w/LALdCVInl0Z4s2
 Q8iA==
X-Gm-Message-State: AFqh2kqn59Kqc0e3N7VWnqe6xng4iPOvMa2FsVp99urrkvBcBGbOaWB8
 msRvZ/iIPQmWVei9QTEgbXNSznaG/sxrxCeZpFf7/w==
X-Google-Smtp-Source: AMrXdXsjRvqWSHDsR8l3QBwYXpO+UNXelcWZlaxXtRmib2eQK9iTBW6uJMU5CQ9hcKJkW6z+vKgVKgUANEwLyLNlfV8=
X-Received: by 2002:a0c:fac8:0:b0:532:f58:9fa6 with SMTP id
 p8-20020a0cfac8000000b005320f589fa6mr116610qvo.124.1672906643423; Thu, 05 Jan
 2023 00:17:23 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Thu, 5 Jan 2023 00:17:22 -0800
Mime-Version: 1.0
In-Reply-To: <87zgaypeih.fsf@linaro.org>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-2-xuchuangxclwt@bytedance.com>
 <87zgaypeih.fsf@linaro.org>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
From: Chuang Xu <xuchuangxclwt@bytedance.com>
Date: Thu, 5 Jan 2023 00:17:22 -0800
Message-ID: <CALophusTwwKS7EEcN5KxdaDjWAkcGncqMkczjL08V7pq2Opkbw@mail.gmail.com>
Subject: Re: [RFC v4 1/3] rcu: introduce rcu_read_locked()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, 
 zhouyibo@bytedance.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000039644b05f17fee29"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000039644b05f17fee29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2023/1/4 =E4=B8=8B=E5=8D=8810:20, Alex Benn=C3=A9e wrote:
> Chuang Xu writes:
>
>> add rcu_read_locked() to detect holding of rcu lock.
>>
>> Signed-off-by: Chuang Xu
>> ---
>> include/qemu/rcu.h | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>
>> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
>> index b063c6fde8..42cbd0080f 100644
>> --- a/include/qemu/rcu.h
>> +++ b/include/qemu/rcu.h
>> @@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
>> }
>> }
>>
>> +static inline bool rcu_read_locked(void)
> We use the locked suffix to indicate functions that should be called
> with a lock held. Perhaps renaming this to rcu_read_is_locked() would
> make the intent of the function clearer?

Yes, rcu_read_is_locked() do make the intent of the function clearer.
I'll rename the function in v5.

Thanks!

>> +{
>> + struct rcu_reader_data *p_rcu_reader =3D get_ptr_rcu_reader();
>> +
>> + return p_rcu_reader->depth > 0;
>> +}
>> +
>> extern void synchronize_rcu(void);
>>
>> /*
>

--00000000000039644b05f17fee29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>On 2023/1/4 =E4=B8=8B=E5=8D=8810:20, Alex Benn=C3=A9e wrote:
<br>&gt; Chuang Xu  writes:
<br>&gt;
<br>&gt;&gt; add rcu_read_locked() to detect holding of rcu lock.
<br>&gt;&gt;
<br>&gt;&gt; Signed-off-by: Chuang Xu=20
<br>&gt;&gt; ---
<br>&gt;&gt;   include/qemu/rcu.h | 7 +++++++
<br>&gt;&gt;   1 file changed, 7 insertions(+)
<br>&gt;&gt;
<br>&gt;&gt; diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
<br>&gt;&gt; index b063c6fde8..42cbd0080f 100644
<br>&gt;&gt; --- a/include/qemu/rcu.h
<br>&gt;&gt; +++ b/include/qemu/rcu.h
<br>&gt;&gt; @@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
<br>&gt;&gt;       }
<br>&gt;&gt;   }
<br>&gt;&gt;  =20
<br>&gt;&gt; +static inline bool rcu_read_locked(void)
<br>&gt; We use the locked suffix to indicate functions that should be call=
ed
<br>&gt; with a lock held. Perhaps renaming this to rcu_read_is_locked() wo=
uld
<br>&gt; make the intent of the function clearer?
<br>
<br>Yes, rcu_read_is_locked() do make the intent of the function clearer.
<br>I&#39;ll rename the function in v5.
<br>
<br>Thanks!
<br>
<br>&gt;&gt; +{
<br>&gt;&gt; +    struct rcu_reader_data *p_rcu_reader =3D get_ptr_rcu_read=
er();
<br>&gt;&gt; +
<br>&gt;&gt; +    return p_rcu_reader-&gt;depth &gt; 0;
<br>&gt;&gt; +}
<br>&gt;&gt; +
<br>&gt;&gt;   extern void synchronize_rcu(void);
<br>&gt;&gt;  =20
<br>&gt;&gt;   /*
<br>&gt;</p>

--00000000000039644b05f17fee29--

