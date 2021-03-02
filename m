Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCA329E11
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:11:53 +0100 (CET)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3sW-0005kJ-OX
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH3rE-0005Du-Fw
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:10:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH3r4-0007Hl-IA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614687017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZW8mUdwQi6bEB2d6Bfmt3mmqLH948RDHTdLXnePrHg=;
 b=QYIaksBlRBoH1xIW9GXduOKLaoMlPOKa0kZCe+YL7c6vfd+jnHXmCHC0xK1yOIFu+N70mE
 fwnZvpvGUgs5/m3vXpcLJY6J1zJEs4cXAsHukXY5kUOdkYUapj6lATffg9bWrTUqXPLXtg
 FABtpFBEirtUb/Lx1NKqDBdMpnKMNJg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-eGfDGxeTMpeQNi3HlVLXrg-1; Tue, 02 Mar 2021 07:10:15 -0500
X-MC-Unique: eGfDGxeTMpeQNi3HlVLXrg-1
Received: by mail-ej1-f72.google.com with SMTP id v19so304912ejc.12
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 04:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ZW8mUdwQi6bEB2d6Bfmt3mmqLH948RDHTdLXnePrHg=;
 b=H62KOqsEuQKOvnCylUk2GaxoYWwEB72DAuGxX99AkBwZkR91X/TTOYbHWlnzXrg6IU
 SIWbQoy0Rd+z3fX6tBiBdDphWdwGtwiQGao7bhpQzECeqCyD5RNL58cdF0ffoWiMaTJs
 z+a5SqYaEDUHJRoniER+5EBCco+rGRXxQXnUR22xEey2/aWC1FPcfre+ISpLEXZ6KKPf
 bBg2/eyzwZR0HjCZRedy23gGUXZCCvKqjqZnAuHHdv8PZ7PFMxiIh4kklQ6Cr62UNPyJ
 nut12YRBtwbGDK35ObRjzG8bg4Aq0Gtk/pxc82Xe2BA5Ii50k1yrkeYx0tdm9LgPnyMk
 aetA==
X-Gm-Message-State: AOAM531+3L9JvrZshT6v40yDr7WsQhJTlFHnYLZjNnbOxmOc9/REHkEZ
 +OutICikNAtUSzlY1h8twvNtYuEwA5NNTfAw6RWPICrmWmVvdmFv8w/HM9NpigWCy+r7TKKCvoD
 9rXF+/OKk6q7lnwBgStq894kiM1hdeTdhHzAS4XN5hx4sPWgQPlthKnSSctrSPPZ8r7c=
X-Received: by 2002:a17:906:874f:: with SMTP id
 hj15mr14823896ejb.404.1614687013422; 
 Tue, 02 Mar 2021 04:10:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIbvw85CiDsTT5qTRW+frZfJZ6EUN2KpClKhp7Q/1ytE1eNZqXM+wBz2xSHMJZLrW/hdCYEg==
X-Received: by 2002:a17:906:874f:: with SMTP id
 hj15mr14823875ejb.404.1614687013111; 
 Tue, 02 Mar 2021 04:10:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k5sm17893235eja.70.2021.03.02.04.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 04:10:12 -0800 (PST)
Subject: Re: [PATCH] chardev: add nodelay option
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210302110444.39084-1-pbonzini@redhat.com>
 <YD4j3ajydE61gT7N@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <50613db7-c8bf-ad75-ee31-c0754c70d7fd@redhat.com>
Date: Tue, 2 Mar 2021 13:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD4j3ajydE61gT7N@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 12:39, Daniel P. Berrangé wrote:
> On Tue, Mar 02, 2021 at 12:04:44PM +0100, Paolo Bonzini wrote:
>> The "delay" option was introduced as a way to enable Nagle's algorithm
>> with ",nodelay".  Since the short form for boolean options has now been
>> deprecated, introduce a more properly named "nodelay" option.  The "delay"
>> option remains as an undocumented option.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   chardev/char-socket.c |  9 +++++++--
>>   gdbstub.c             |  2 +-
>>   qemu-options.hx       | 14 +++++++-------
>>   3 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index 06a37c0cc8..73a7afe5a0 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -1472,8 +1472,13 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
>>       sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
>>       qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>>   
>> -    sock->has_nodelay = qemu_opt_get(opts, "delay");
>> -    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
>> +    sock->has_nodelay =
>> +        qemu_opt_get(opts, "delay") ||
>> +        qemu_opt_get(opts, "nodelay");
>> +    sock->nodelay =
>> +        !qemu_opt_get_bool(opts, "delay", true) ||
>> +        qemu_opt_get_bool(opts, "nodelay", false);
> 
> We should raise an explicit error if both options are present,
> otherwise you get into a debate about prioritization with nonsense
> such as
> 
>     -chardev socket,.....,delay=on,nodelay=on

Good point, we can squash this in:

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 73a7afe5a0..c8bced76b7 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1472,6 +1472,10 @@ static void qemu_chr_parse_socket(QemuOpts *opts, 
ChardevBackend *backend,
      sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
      qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));

+    if (qemu_opt_get(opts, "delay") && qemu_opt_get(opts, "nodelay")) {
+        error_setg(errp, "'delay' and 'nodelay' are mutually exclusive");
+        return;
+    }
      sock->has_nodelay =
          qemu_opt_get(opts, "delay") ||
          qemu_opt_get(opts, "nodelay");

Paolo


