Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209D5FD7FD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:57:57 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivuT-0000lr-HR
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jb-gnumlists@wisemo.com>)
 id 1oivF8-0007Qc-0X
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:15:10 -0400
Received: from smtpv6n-hq2.wisemo.com ([2a01:4f0:4018::24b]:14268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jb-gnumlists@wisemo.com>)
 id 1oivF5-0004Vc-9J
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wisemo.com;
 s=v2016; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID;
 bh=UJ5mdMOhcvHkhBaF1Gm8ABc070ZuO15WCAqbfcHJf0c=; 
 b=EKBJREj+msiNP/BFFc26B7SHBOKzHXfzMIcWEWhj4WDD2x62Lt+/enw+sZMoK3RRlgibZt9l9qKj3QoXn9kxCFzIkZ56T8qj8NMV0PnJ7gqsYIacfK3SE+JNH0ieaxIB1V6uiTHWtoSckYmy77dD5qGJcbfVkR/EL2YUaKAB9mYFSjtBulSHMa7OoxT0nJw4fcmy0QASEo1EsIJmwaDlws9EVMHHPF4dudAH79MMZLwrQrZcRuTVyhu1qDc+Oj0BEcjPusI4A2Hv7GQ8c4IfKL5Cnai6VUVCX5FlgBeSXiTCeVz2PCJBAW5xvr5npCPBiG4hJPH5WCTbaBTwHWhv6w==;
Received: from spaceout.i.wisemo.com ([192.168.2.112] helo=[10.240.3.11])
 by mailout.i.wisemo.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <jb-gnumlists@wisemo.com>)
 id 1oivEx-0008ET-Ri; Thu, 13 Oct 2022 12:14:59 +0200
Message-ID: <a461e20d-2f90-84a8-4c4c-ae6e94eb4685@wisemo.com>
Date: Thu, 13 Oct 2022 12:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] net: print a more actionable error when slirp is not found
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, jasowang@redhat.com
References: <20220929163237.1417215-1-marcandre.lureau@redhat.com>
 <2973900.g0HVWOepMQ@silver>
 <CAMxuvawttTSHMwzaUYpmKNCh8fauR1xCgEhaQD3C2GJDKFyZ5Q@mail.gmail.com>
From: Jakob Bohm <jb-gnumlists@wisemo.com>
Organization: WiseMo A/S
In-Reply-To: <CAMxuvawttTSHMwzaUYpmKNCh8fauR1xCgEhaQD3C2GJDKFyZ5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f0:4018::24b;
 envelope-from=jb-gnumlists@wisemo.com; helo=smtpv6n-hq2.wisemo.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/2022 15:49, Marc-André Lureau wrote:
> Hi
>
> On Fri, Sep 30, 2022 at 11:49 PM Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
>> On Donnerstag, 29. September 2022 18:32:37 CEST Marc-André Lureau wrote:
>>> From: Marc-AndrÃ© Lureau <marcandre.lureau@redhat.com>
>>>
>>> If slirp is not found during compile-time, and not manually disabled,
>>> print a friendly error message, as suggested in the "If your networking
>>> is failing after updating to the latest git version of QEMU..." thread
>>> by various people.
>>>
>>> Signed-off-by: Marc-AndrÃ© Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>   meson.build |  4 ++++
>>>   net/net.c   | 19 +++++++++++++++++--
>>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 8dc661363f..4f69d7d0b4 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -657,6 +657,10 @@ if not get_option('slirp').auto() or have_system
>>>     endif
>>>   endif
>>>
>>> +if get_option('slirp').disabled()
>>> +  config_host_data.set('CONFIG_SLIRP_DISABLED', true)
>>> +endif
>>> +
>>>   vde = not_found
>>>   if not get_option('vde').auto() or have_system or have_tools
>>>     vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
>>> diff --git a/net/net.c b/net/net.c
>>> index 2db160e063..e6072a5ddd 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -990,14 +990,29 @@ static int net_init_nic(const Netdev *netdev, const
>>> char *name, return idx;
>>>   }
>>>
>>> +#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
>>> +static int net_init_user(const Netdev *netdev, const char *name,
>>> +                         NetClientState *peer, Error **errp)
>>> +{
>>> +#ifdef CONFIG_SLIRP
>>> +    return net_init_slirp(netdev, name, peer, errp);
>>> +#else
>>> +    error_setg(errp,
>>> +               "Type 'user' is not a supported netdev backend by this QEMU
>>> build " +               "because the libslirp development files were not
>>> found during build " +               "of QEMU.");
>>> +#endif
>>> +    return -1;
>>> +}
>>> +#endif
>> I just tried this, but somehow it is not working for me. net_init_user() is
>> never called and therefore I don't get the error message. That should be
>> working if the user launched QEMU without any networking arg, right?
>>
> That's because vl.c has:
> if (default_net) {
> ...
> #ifdef CONFIG_SLIRP
>          qemu_opts_parse(net, "user", true, &error_abort);
> #endif
>
> Iow, it doesn't try to use slirp by default if it's not found at
> compile time. We can eventually change that, but that might break
> existing users who don't build with slirp.
>
> Alternatively, it could error out only if slirp was not explicitly
> disabled at configure time.
>
>> And still, I would find it better if there was also a clear build-time error
>> if there was no libslirp and slirp feature was not explicitly disabled.
> That's not the typical way we deal with dependencies, but I can try to
> do that as well.
Maybe change that ifdef section to report the error early instead of 
introducing the new
helper function, something like

  #ifdef CONFIG_SLIRP
          qemu_opts_parse(net, "user", true, &error_abort);
+        // Explicit error messages, because it is not obvious to users that
+        //     "user" networking is based on code from libslirp.
+#elif !defined(CONFIG_SLIRP_DISABLED))
+        some_error_function(
+            "Type 'user' is not a supported netdev backend by this QEMU build "
+            "because the libslirp development files were not found during build "
+            "of QEMU.");
+#else
+        some_error_function(
+            "Type 'user' is not a supported netdev backend by this QEMU build "
+            "because QEMU was explicitly built without libslirp");
  #endif

Also output these messages when the user backend is explicitly requested 
and not CONFIG_SLIRP.

>>>   static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>>>       const Netdev *netdev,
>>>       const char *name,
>>>       NetClientState *peer, Error **errp) = {
>>>           [NET_CLIENT_DRIVER_NIC]       = net_init_nic,
>>> -#ifdef CONFIG_SLIRP
>>> -        [NET_CLIENT_DRIVER_USER]      = net_init_slirp,
>>> +#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
>>> +        [NET_CLIENT_DRIVER_USER]      = net_init_user,
>>>   #endif
>>>           [NET_CLIENT_DRIVER_TAP]       = net_init_tap,
>>>           [NET_CLIENT_DRIVER_SOCKET]    = net_init_socket,
>>>


Enjoy

Jakob
-- 
Jakob Bohm, CIO, Partner, WiseMo A/S.  http://www.wisemo.com
Transformervej 29, 2860 Soborg, Denmark.  Direct +45 31 13 16 10
This public discussion message is non-binding and may contain errors.
WiseMo - Remote Service Management for PCs, Phones and Embedded


