Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62B3A13AE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:03:18 +0200 (CEST)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwvU-00018X-VI
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqwuD-0000RO-1o
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqwuB-00071j-4X
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJQgb8+TiKIyVhTfQKPxLNAg9oSrr1nSFwYiPrPdhyU=;
 b=HMehf42j5HEzTvtAnoPULrTzli2UAzMqJA5UMgpMgK7vumj6yNZUacMutIPLfLFAZJG3l+
 ehA1ttlbrdlM9VMwmglPAqrwmgsVtdLxtrQwCY4S7/tEXYanc41n4JqdtQQTBIObEFU2A0
 nwjxSPvP/VOvKGQXXJu+/UxKpMgbY7g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-3_vdRaSWNM65HnnuojTUig-1; Wed, 09 Jun 2021 08:01:52 -0400
X-MC-Unique: 3_vdRaSWNM65HnnuojTUig-1
Received: by mail-wm1-f69.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so2535229wmq.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pJQgb8+TiKIyVhTfQKPxLNAg9oSrr1nSFwYiPrPdhyU=;
 b=GNMj8+CRTbLggtzOrevJuNxdnNvNHWGIE/ARfiepXrSoP8SXLRqhRcX1yFx9aFr8xy
 Iku701EUaK8v0sBAZOzi6tHcrmN/am3gxbZpox7Hl5/dRglFi+J86or4SkPWpufCHW9o
 JMOwpeRR3OetuaP1IjlM3ltfQEYHjFeTBO2WuE7DTclAJaiPjxn8kqajzC0moWCHCTRL
 kRx1czH3k8G6CuoMk2lOf+IElBB4aHdO7Lyn+R0tiOjGeKjGKomtcoKhkQTPlJ2usCzW
 SDRFSnRfV6yvyEqxy9LhwsrRCg+Wmb/FeD/oT+RLFmtk5MXJWPVUOJEx0xSiTnuaxZjT
 me5Q==
X-Gm-Message-State: AOAM531GmIiHjZeQiKNYYIyTjeBtiBrXmkulVLMXHG5Y2E4pmIEMsZcj
 gukGMjHzrW2zk7w4sPWOXmjTnZjD4cCbUf7zE8iepdit657ABr9p2fegIaNlIuhffHGfVi4u6n9
 +THqIsGfeYkFcaeY=
X-Received: by 2002:a5d:618f:: with SMTP id j15mr23327839wru.348.1623240111599; 
 Wed, 09 Jun 2021 05:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl/x5ODKLoJkzroqn2A9A7+bpNj32gnVCChBwcMvyuJPjkcqNMmaEeWfXmG4oqt1oHiE00gw==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr23327810wru.348.1623240111398; 
 Wed, 09 Jun 2021 05:01:51 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de.
 [217.232.61.128])
 by smtp.gmail.com with ESMTPSA id 31sm25921566wrc.96.2021.06.09.05.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:01:50 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
 <YMCmNrcNByZ+Ozxn@redhat.com>
 <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
Message-ID: <16fdaf9e-e3ed-9de5-932c-3db33c6f77ee@redhat.com>
Date: Wed, 9 Jun 2021 14:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: libvir-list@redhat.com, smitterl@redhat.com, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 13.49, Gerd Hoffmann wrote:
> On Wed, Jun 09, 2021 at 12:29:58PM +0100, Daniel P. Berrangé wrote:
>> On Wed, Jun 09, 2021 at 01:24:05PM +0200, Gerd Hoffmann wrote:
>>> On Wed, Jun 09, 2021 at 12:02:40PM +0200, Thomas Huth wrote:
>>>> Libvirt's "domcapabilities" command has a way to state whether
>>>> certain graphic frontends are available in QEMU or not. Originally,
>>>> libvirt looked at the "--help" output of the QEMU binary to determine
>>>> whether SDL was available or not (by looking for the "-sdl" parameter
>>>> in the help text), but since libvirt stopped doing this analysis of
>>>> the help text, the detection of SDL is currently broken, see:
>>>>
>>>>   https://bugzilla.redhat.com/show_bug.cgi?id=1790902
>>>>
>>>> QEMU should provide a way via the QMP interface instead. The simplest
>>>> way, without introducing additional commands, is to make the DisplayType
>>>> enum entries conditional, so that the enum only contains the entries if
>>>> the corresponding CONFIG_xxx switches have been set.
>>>
>>> Hmm, that'll break for the "dnf remove qemu-ui-sdl" case ...
>>
>> Note tht libvirt invalidates its cache of QEMU capabilities when it
>> sees the /usr/lib64/qemu directory timestamp change. So it ought to
>> pick up changes caused by installing/removing QEMU modules, and apply
>> this to future queries for domcapabilities, or when starting future
>> QEMU guests.
> 
> That'll work fine for modules implementing qom objects / devices,
> because the list of available objects changes accordingly and libvirt
> can see that.
> 
> The #if CONFIG_SDL approach will not work because qemu will continue to
> report sdl as supported even when the sdl module is not installed any
> more.

I guess we'd need a separate QMP command to fix that, which tries to load 
the modules first when being called? Something similar to what is being done 
in qemu_display_help() ?
That's certainly doable, too, just a little bit more complex... do we want 
that? Or is the quick-n-easy way via the schema good enough for most use 
cases? (I'm not that familiar with "virsh domcapabilities" ... is there any 
real usage for the <graphics> section or is this rather cosmetical?)

  Thomas


PS: My CI runs with the patch just finished, and apparently I missed some 
#ifdefs in other parts of the code ... so I need to respin this patch 
anyway, no matter which direction we decide to go...


