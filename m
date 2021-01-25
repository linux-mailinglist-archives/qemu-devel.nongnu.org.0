Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8E302E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 22:58:30 +0100 (CET)
Received: from localhost ([::1]:39790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l49sT-0003qg-Qh
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 16:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l49rN-0003RH-2G
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l49rL-0006J5-Bg
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 16:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611611838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZBjO5i+suxYbvQGRWDeub+YpaPJZ4zPAAyPKokapq4=;
 b=T5JMfcNdqmGUFXJYzu8MQp/9wIXT3hxTmdM6AywMl+s+BcRfOnRUiPpfYIn0iH7E7p9R2P
 VU6y5+ZsAKqFP2HvxhvU0zelp5pXsaWhXMYi+Z9HNEWlyzDaclGfAIMPSXXTfcIOkwpsTj
 53bm7c7zex3zoxuoKFJH7ffAXwABwSs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-KtytZoebPLeCTsRLdMIqRQ-1; Mon, 25 Jan 2021 16:57:15 -0500
X-MC-Unique: KtytZoebPLeCTsRLdMIqRQ-1
Received: by mail-ed1-f72.google.com with SMTP id n8so8266790edo.19
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 13:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZBjO5i+suxYbvQGRWDeub+YpaPJZ4zPAAyPKokapq4=;
 b=iVR+Q+h3q1YRhzrgfJI1akv/lELz3wpQWNYYh6qLW6cdENecsqeIqscQ5N8G6K/DLK
 SdEDsOWUKEbgU6vAybb2LMRR+bxNbQDqTp0pZNszzELGULPJ4WjegKtIZa5u4J7YBw6B
 nVU+FESBvEZ+WxU0dlhFecdQdHVBp2RKzJtVrjUk5EydNrg8KflF/WyPXss/pf6gWtF4
 6NUZqNQX/n+X2ieIXr3XteLdQZcBDgJBZa7hN78jJlUqP3/9LyLfkoTObmptMyAWnq5c
 tkf1jPV0nQ7FbBu8fZOI6677BIjAkX8NacbLuxe979arAqdbN1rp1gGy+WyV6d9yhRaH
 0qKQ==
X-Gm-Message-State: AOAM533MVEXkRmpvcGs5Lri8gD5wawqqwlwI9KKVItpi+JfLmUIWb7fF
 7K5Rhh372OQk/fyYXAsH1JYZACmbErEif9sEQYduB7hZxUgr/gMk16C8UEW/2FeBwBB/45VQgut
 2uyGxdJFeDVVxTDM=
X-Received: by 2002:a17:906:6b91:: with SMTP id
 l17mr1516911ejr.171.1611611834062; 
 Mon, 25 Jan 2021 13:57:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHbHOQTzcMTEn47pxboYjk6OSKGRgCi67Yk1y/cl0FG6N48IpiHPyzRpyCbQ1nT7LPrR+M+A==
X-Received: by 2002:a17:906:6b91:: with SMTP id
 l17mr1516900ejr.171.1611611833887; 
 Mon, 25 Jan 2021 13:57:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l13sm10525971edq.37.2021.01.25.13.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 13:57:13 -0800 (PST)
To: Peter Lieven <pl@kamp.de>, dillaman@redhat.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, philmd@redhat.com
References: <23268a39-078d-ed13-6bb4-590ce1292662@kamp.de>
 <b8dff207-21d9-ce8f-63b3-f877d29d90c6@kamp.de>
 <bb07c231-6584-0d4d-959b-46948c9ab9bc@redhat.com>
 <00855a0d-33e0-d835-e6e0-4d3af963975b@kamp.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: configure does not detect librados or librbd since the switch to
 meson
Message-ID: <7499e47d-b3d9-5ca5-2321-45b04ba06fca@redhat.com>
Date: Mon, 25 Jan 2021 22:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <00855a0d-33e0-d835-e6e0-4d3af963975b@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 20:47, Peter Lieven wrote:
>> Can you include the meson-logs/meson-log.txt output?
> 
> Sure:https://pastebin.com/u3XtbDvQ

Does this work for you?

diff --git a/meson.build b/meson.build
index 690d48a6fd..a662772c4a 100644
--- a/meson.build
+++ b/meson.build
@@ -14,6 +14,9 @@ config_host = keyval.load(meson.current_build_dir() / 
'config-host.mak')
  enable_modules = 'CONFIG_MODULES' in config_host
  enable_static = 'CONFIG_STATIC' in config_host

+# Allow both shared and static libraries unless --enable-static
+static_kwargs = enable_static ? {'static': true} : {}
+
  # Temporary directory used for files created while
  # configure runs. Since it is in the build directory
  # we can safely blow away any previous version of it
@@ -679,10 +682,10 @@ endif
  rbd = not_found
  if not get_option('rbd').auto() or have_block
    librados = cc.find_library('rados', required: get_option('rbd'),
-                             static: enable_static)
+                             kwargs: static_kwargs)
    librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
                             required: get_option('rbd'),
-                           static: enable_static)
+                           kwargs: static_kwargs)
    if librados.found() and librbd.found() and cc.links('''
      #include <stdio.h>
      #include <rbd/librbd.h>
@@ -693,6 +696,9 @@ if not get_option('rbd').auto() or have_block
      }''', dependencies: [librbd, librados])
      rbd = declare_dependency(dependencies: [librbd, librados])
    endif
+  if not rbd.found() and get_option('rbd').enabled()
+    error('could not link librbd')
+  endif
  endif

  glusterfs = not_found

(It's not a complete patch, all instances of "static: enable_static" 
would need to be changed because other libraries could have the same issue).

Thanks,

Paolo


