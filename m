Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A610D988
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 19:18:32 +0100 (CET)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iakqa-0001Ty-Vt
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 13:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iakkk-0007tM-UI
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 13:12:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iakke-0006av-MA
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 13:12:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60758
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iakke-0006XY-9W
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 13:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575051139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwg2Z5Y02hhVxGbPEesgaw/C+JhjkJ4a8QmxgSQLLOs=;
 b=TuiiJtdVFiaHL9XJibEoVVw0RxYkDhdwupuFBLcadiRTy9jQGePNO8fWVl9FlyohQCvgHl
 q4ejnK78AYPbsWDQhmMgeyfm4lkfUS85gCLaj1biEaeu/9iKz81W5wcgFNLFnreuLV0CUj
 4UCDfuNwu6fsGz+5a1xaFVxo/b8GIgs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-ySvN6yQXObCWg3EZWVa9fg-1; Fri, 29 Nov 2019 13:12:17 -0500
Received: by mail-wm1-f69.google.com with SMTP id l11so4824012wmi.0
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 10:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dwg2Z5Y02hhVxGbPEesgaw/C+JhjkJ4a8QmxgSQLLOs=;
 b=ClsYrG39MlJT3PyPWsA6H/ddNE6R9AOtzhGmBkwoWqxQzy+mYANScZ6vSBLkxRiyfC
 cMdLbbXIkZ5hSTklkWS6T4wtyUCOMr5tCbr51hKvV6TXofMZOhKnN7fmmNxJ4dqbNndC
 u3q7pbFJVf7U56S6Uf0bCoGJjXwXYHJvHxcQUI0ImI5/RUPSJtUCpDDkOTN5/z37El+Y
 a0eyYrv4GgleF14N51hPIViuWZVzpQ1pjfmALaSlwQPwTpqaFik5JdF79KDfE7somMP1
 sHP4Jujk/wadlG97cw/BNiFZS9l6pfaCLl9x6Ivo9eoWAbrWQ2UKCmVPANYQxNgIcdse
 i+pA==
X-Gm-Message-State: APjAAAUjSR5QLBjO5lYXlT90Rq62qo8b5gccNcWOcCacASSj51Opvbzy
 0HQTyQsqvdQDuIXc6Tv4dHdLY1QZMeI6ull+La+pOo9LAeWYujURd8o2vZGLWr5Co9+2CPRqkA2
 w5cu9aqiaQL3cIJI=
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr8204877wrr.215.1575051136735; 
 Fri, 29 Nov 2019 10:12:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6t5o2r4dvDEZl4JeqFvCM6ebxnwpn+2cHrpGTHXg+pBhwLiH9heGod4/GXWLpn/QBKpvgAA==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr8204846wrr.215.1575051136462; 
 Fri, 29 Nov 2019 10:12:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:56e1:adff:fed9:caf0?
 ([2001:b07:6468:f312:56e1:adff:fed9:caf0])
 by smtp.gmail.com with ESMTPSA id i71sm31111832wri.68.2019.11.29.10.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 10:12:15 -0800 (PST)
Subject: Re: libcap vs libcap-ng mess
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20191128190408.GC3294@work-vm>
 <20191129093409.GB2260471@redhat.com>
 <98520a07-cf5d-a2a9-cfa4-944839b94c7c@redhat.com>
 <20191129180103.GA2840@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1e59f880-1a62-3230-c56a-533f2b797525@redhat.com>
Date: Fri, 29 Nov 2019 19:12:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129180103.GA2840@work-vm>
Content-Language: en-US
X-MC-Unique: ySvN6yQXObCWg3EZWVa9fg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: thuth@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/19 19:01, Dr. David Alan Gilbert wrote:
>> It's not entirely trivial because fsdev-proxy-helper wants to keep the
>> effective set and clear the permitted set; in libcap-ng you can only
                     ^^^^^

(Wrong, this is "modify" the permitted set.  The permitted set is
already cleared by setresuid/setresgid).

>> apply both sets at once, and you cannot choose only one of them in
>> capng_clear/capng_get_caps_process.  But it's doable, I'll take a look.
> I'm having some difficulties making the same conversion for virtiofsd;
> all it wants to do is drop (and later recover) CAP_FSETID
> from it's effective set;  so I'm calling capng_get_caps_process
> (it used to be cap_get_proc).  While libcap survives just using the
> capget syscall, libcap-ng wants to read /proc/<TID>/status - and
> that's a problem because we're in a sandbox without /proc mounted
> at that point.

The state of libcap-ng persists after capng_apply.  So you can just call
capng_update({CAP_ADD,CAP_DROP}) followed by capng_apply.

Does virtiofsd have to do uid/gid dances like virtfs-proxy-helper?

Thanks,

Paolo


