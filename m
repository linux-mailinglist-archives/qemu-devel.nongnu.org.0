Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF74E2B67
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:01:46 +0100 (CET)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJXW-0002M4-00
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:01:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWJUn-00006Z-O9
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:57 -0400
Received: from [2a00:1450:4864:20::630] (port=40578
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWJUl-0006Hx-VZ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id p15so30399797ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u+H0quZwXpVSrcN7fsd442OmWP9Md2nYlwYqbjy5JQo=;
 b=G3e2lAaa/5zWlVXaSfDwSojix7eKy6qDWAhjLrJQMSotjJT8sVCLPpXJXoP42zzR7b
 q4o4FE/CvRQFJu21T31Ri3BmnEbfmts8+ekmyNU8MJcp5V4JYTcGt27wyowLm7AwTtBt
 4FClDVDf3dDDj3Blu08EGH7TvCxtiHcyHDQvu05R0oXB1HBLp/AEfrIlIRIE+JuFLRwR
 APGsB3x1Z31YmCqES4+e5yyKUmqLKjlWeHAjKKa06ve/A+Dk9JTCgTX5a6x3bUi9v1Be
 JYqwZG759UQ+zktFzRcMrAiT/7lVLYTCggZUhniljVYw/Sq3Rx9n5snjyCIgFq/Z8OHW
 yDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u+H0quZwXpVSrcN7fsd442OmWP9Md2nYlwYqbjy5JQo=;
 b=Afj/qPflpvk1RkIMtKcepJJvkG/rHzlOMYwQmobrXN0UrDH+CXjR1H0TxzvTsHqafV
 M9aAZ4ATZFGhn+/rycNJ14+hLJCRBSt80N1hHGEi9yKi0Lpk9zoGlWYEYRKqXpHFUmhr
 C+xStbs0cn8+wSEJKTYiLwe+2OL5rhr3nohQMPDdhZiFFp2p8qZVoBUbGfsNtw/B5mtm
 uLE4JbnVCAQju5aeuOVN401VBoXTET9JHlRyOJ3kXhpQjiahtCzGuohem1d91ajRsK1V
 06Q+6l+92zJS3PQW5Zg7ipB7cd46uekM1Roiq9sRkpGWR7OqXU7WcHiARj1mqass6MVd
 avPQ==
X-Gm-Message-State: AOAM533K+A5nfYZPT3j5G5k3dZZ2+6ZeqSvlmeUR2wuOJgyeQ2UgW18G
 b2IrgH/aIsLiZvpvuftyokeSgfO89IQ=
X-Google-Smtp-Source: ABdhPJxrD5MHdfpDhtYMriQ6Wwofw+O/Jaqmj1XWsPMC+7/f6kHreaEfM++5r8KaUEoC2NDRhB1llw==
X-Received: by 2002:a17:907:7d93:b0:6da:8f57:68fa with SMTP id
 oz19-20020a1709077d9300b006da8f5768famr21749487ejc.42.1647874734028; 
 Mon, 21 Mar 2022 07:58:54 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.170.240])
 by smtp.googlemail.com with ESMTPSA id
 p3-20020a1709060e8300b006d0e8ada804sm6859006ejf.127.2022.03.21.07.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 07:58:53 -0700 (PDT)
Message-ID: <177c8b62-0a12-75d0-6a76-5480e3e12f68@redhat.com>
Date: Mon, 21 Mar 2022 15:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Mark Kanda <mark.kanda@oracle.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
 <20220215150433.2310711-2-mark.kanda@oracle.com>
 <87a6dw7i55.fsf@pond.sub.org>
 <efd0b85b-beb1-feeb-6c38-510f8bc36af9@oracle.com>
 <874k3r5s9q.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <874k3r5s9q.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 14:50, Markus Armbruster wrote:
> Mark Kanda <mark.kanda@oracle.com> writes:
>> Thank you Markus.
>> On 3/11/2022 7:06 AM, Markus Armbruster wrote:
>>> Are the stats bulky enough to justfify the extra complexity of
>>> filtering?
>>
>> If this was only for KVM, the complexity probably isn't worth it. However, the
>> framework is intended to support future stats with new providers and targets
>> (there has also been mention of moving existing stats to this framework).
>> Without some sort of filtering, I think the payload could become unmanageable.
> 
> I'm deeply wary of "may need $complexity in the future" when $complexity
> could be added when we actually need it :)

I think it's better to have the filtering already.  There are several 
uses for it.

Regarding filtering by provider, consider that a command like "info jit" 
should be a wrapper over

{ "execute": "query-stats", "arguments" : { "target": "vm",
   "filters": [ { "provider": "tcg" } ] } }

So we have an example of the intended use already within QEMU.  Yes, the 
usefulness depends on actually having >1 provider but I think it's 
pretty central to the idea of having a statistics *subsystem*.

Regarding filtering by name, query-stats mostly has two usecases.  The 
first is retrieving all stats and publishing them up to the user, for 
example once per minute per VM.  The second is monitoring a small number 
and building a relatively continuous plot (e.g. 1-10 times per second 
per vCPU).  For the latter, not having to return hundreds of values 
unnecessarily (KVM has almost 60 stats, multiply by the number of vCPUs 
and the frequency) is worth having even just with the KVM provider.

>>> Can you give a use case for query-stats-schemas?
>>
>> 'query-stats-schemas' provide the the type details about each stat; such as the
>> unit, base, etc. These details are not reported by 'query-stats' (only the stat
>> name and raw values are returned).
> 
> Yes, but what is going to use these type details, and for what purpose?

QEMU does not know in advance which stats are provided.  The types, etc. 
are provided by the kernel and can change by architecture and kernel 
version.  In the case of KVM, introspection is done through a file 
descriptor.  QEMU passes these up as QMP and in the future it 
could/should extend this to other providers (such as TCG) and devices 
(such as block devices).

See the "info stats" implementation for how it uses the schema:

vcpu (qom path: /machine/unattached/device[2])
   provider: kvm
     exits (cumulative): 52369
     halt_wait_ns (cumulative nanoseconds): 416092704390

Information such as "cumulative nanoseconds" is provided by the schema.

> Have you considered splitting this up into three parts: unfiltered
> query-stats, filtering, and query-stats-schemas?

Splitting could be an idea, but I think only filtering would be a 
separate step.  The stats are not really usable without a schema that 
tells you the units, or whether a number can go down or only up.  (Well, 
a human export could use them through its intuition, but a HMP-level 
command could not be provided).

> We could perhaps merge with the current schema, then clean it up on top,
> both in 7.1, if that's easier for you.

The serialized JSON would change, so that would be a bit worrisome (but 
it makes me feel a little less bad about this missing 7.0).  It seems to 
be as easy as this, as far as alternates go:

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3cb389e875..48578e1698 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -554,7 +554,7 @@ def check_alternate(expr: _JSONObject, info: 
QAPISourceInfo) -> None:
          check_name_lower(key, info, source)
          check_keys(value, info, source, ['type'], ['if'])
          check_if(value, info, source)
-        check_type(value['type'], info, source)
+        check_type(value['type'], info, source, allow_array=True)


  def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index b7b3fc0ce4..3728340c37 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -243,6 +243,7 @@ def alternate_qtype(self):
              'number':  'QTYPE_QNUM',
              'int':     'QTYPE_QNUM',
              'boolean': 'QTYPE_QBOOL',
+            'array':   'QTYPE_QLIST',
              'object':  'QTYPE_QDICT'
          }
          return json2qtype.get(self.json_type())
@@ -1069,6 +1070,9 @@ def _def_struct_type(self, expr, info, doc):
              None))

      def _make_variant(self, case, typ, ifcond, info):
+        if isinstance(typ, list):
+            assert len(typ) == 1
+            typ = self._make_array_type(typ[0], info)
          return QAPISchemaVariant(case, info, typ, ifcond)

      def _def_union_type(self, expr, info, doc):


I'll try to write some testcases and also cover other uses of
_make_variant, which will undoubtedly find some issue.

Paolo

