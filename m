Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352039F7D3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:28:25 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbmK-0007No-Ht
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqblQ-0006Vt-Ly
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqblO-0000Jd-4q
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623158845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vA4wvQfYCSoeKhPAGn80z1qKFcAzjBUUQDbPFHYSpk=;
 b=iWa7k63ITHSCEl1DIG1ApCvMT2M/Rw37sikSwS9VPDW8TfqzoEawICBFzOqSmWcH1I8iL1
 AOeJoOmYCtBvARUQmCyNjv1q4+c+eQUJqgWYb4C+msoAL+LrUDKvYjcYuW0VW6mxn0SS07
 V+0TGx50VnN4Sp9FTgr+TGSXym/uB70=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-I5idgFm3MrejOPaXPYGowQ-1; Tue, 08 Jun 2021 09:27:21 -0400
X-MC-Unique: I5idgFm3MrejOPaXPYGowQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1168241wmn.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 06:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9vA4wvQfYCSoeKhPAGn80z1qKFcAzjBUUQDbPFHYSpk=;
 b=rJaWb/DIoAgaKdpskyMxbsiSpoDq3zftghnztFAr2CSQEB+d4HhRCsJ6ZJfn2PUhpP
 +cMJooSrhVvAW7kYLFNHsU5jedIlW5FjzqjHLEln3U2jcu41pxEX38VPcvoGgLyfXjeP
 Tu7WyXC9CmL7GbPOH+MjVkz3HYsgXwUniGl/CcotNAgaBrT0sNMW3md3Tsd5GkJscvI0
 XQWM6jmOP6frHF3800RUCMEdgGc1MBPin/62asBD9PlASBVOw5JvZvPVsAzeep4seCdr
 7NwRs1eAK8JtMCDw4uhDrOzZuqvzwMMI1b2gDM+drovK2C9nLxZlAl+PM4s2lNKyXccr
 aFnA==
X-Gm-Message-State: AOAM531JwxYmR3Gr+3khOX72Z4XrqQoPzTkqMJxWqbHXDwNWfoIMh+dH
 QK1jvYM6lWFovDwYAirYat8GCVpFEODjQINPLCEE1P7m8niWK4N8oZOIs2rLNNtEfr8HhbGODHk
 y6Ar6gKK1J2LDbdQ=
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr9225043wmq.9.1623158840409; 
 Tue, 08 Jun 2021 06:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylQBxEitZrtxDCDgewPArswnFO06OKcOMq/jPJe1KEdGJXJ90zi+77A4EdBSPKOmdHCTO1UQ==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr9225019wmq.9.1623158840190; 
 Tue, 08 Jun 2021 06:27:20 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id 25sm2952365wmk.20.2021.06.08.06.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 06:27:19 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
Date: Tue, 8 Jun 2021 15:27:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210526170432.343588-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/2021 19.04, Philippe Mathieu-Daudé wrote:
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
> 
> - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>    specific information. Currently the common structure base
>    provides the name of the accelerator, while the specific
>    part is empty, but each accelerator can expand it.
> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>      { "execute": "query-accels" }
>      {
>          "return": [
>              {
>                  "name": "qtest"
>              },
>              {
>                  "name": "kvm"
>              }
>          ]
>      }
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>    to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>    at runtime (chat with jsnow / eblake).
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
>   accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
>   accel/meson.build        |  2 +-
>   3 files changed, 87 insertions(+), 1 deletion(-)
>   create mode 100644 accel/accel-qmp.c
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b72..586a61b5d99 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,57 @@
>   ##
>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>     'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [
> +      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
> +      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
> +      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
> +      { 'name': 'qtest' },
> +      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
> +      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
> +      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
> +
> +##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'AcceleratorInfo',
> +  'data': { 'name': 'Accelerator' } }
> +
> +##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.
> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "name": "qtest"
> +#        },
> +#        {
> +#            "name": "kvm"
> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }

What about Markus' comment here:

  https://lore.kernel.org/qemu-devel/87mtsoieyz.fsf@dusky.pond.sub.org/

?

If I've got him right, you don't need the command at all, the Accelerator
enum should be sufficient?

  Thomas
  


