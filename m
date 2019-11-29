Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C610D928
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 18:51:12 +0100 (CET)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iakQ7-0003EV-SB
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 12:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iakLb-0001la-15
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 12:46:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iakLX-0007iY-QH
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 12:46:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60869
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iakLX-0007ee-17
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 12:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575049579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDFGFSjWz4m3thW+iBdZ+A/pQ7+CAgzwzoN+RD31uZg=;
 b=g0nmyS5dBziB5YCe20wSKYCUnsJ/C0/OEpAEfyumxju5Utmj37bmhBM7Yc+mZyw3hj5HXT
 zTGhxYeyc63yoNEuzMGBXfg1jWlPeX8yOcsQcFqRme/Dnr90X7Mpp/QUZPJxKzmK4EW/tM
 vYh6HfZMrBEA02AAFVjrnRn9G7Eb+2A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-k5upyYCpMGenXqCLPQ3Lxw-1; Fri, 29 Nov 2019 12:46:16 -0500
Received: by mail-wr1-f70.google.com with SMTP id m17so15869233wrb.20
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 09:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gDFGFSjWz4m3thW+iBdZ+A/pQ7+CAgzwzoN+RD31uZg=;
 b=oueF6Mof6q2gV1+rJGhDHfyMInmJuV+FGV2ICioXv18m86DZTzPcmdAMb86fzfFhH8
 /g9nojC8kvXNYeC/3IAsx5t2VkdBohhkVsU/LDX06nZSI2aAPgW9WlIy4w0EBmhdICKP
 l22YDgexwhRAjmwim/eDt8KCOaOW/Mu5ZA/9RSrUIGJfiC/Gdz0qq2wfWLhzmaKeJaEJ
 OmL2G60UP7/OUmSHW4yE642pOBIrtJUMjom1VElcsY/a3cYLM1u3Z9WVdUalFRuD1CJD
 QFwKj3xfcUZK8GwU2ZTeJ+TpFn0zb0mlRo3YnF9oD9TTkNHeO5zeM0f+FbymGZgKFcxv
 OY+A==
X-Gm-Message-State: APjAAAWSzVyMM1bYqJS/wLRIe44bz0LJlwka+zs3pstSX/TAvx5CRvCN
 AQIznDmWHR7xT6j7+qkb1R8al6eAjQWa+MMD/U0J1cp8TVzaeuNdKW3mStVNa0hZbRDt1gUzceB
 FN1yNIkIYZig+I9g=
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr15660051wml.56.1575049574979; 
 Fri, 29 Nov 2019 09:46:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVaMZfce2L4JHIEcEAnE+JGgjg4hyY7PD3A16d6GKzzDej/rQXtxCbBSLJecWdLcKTI2Tq0Q==
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr15660020wml.56.1575049574630; 
 Fri, 29 Nov 2019 09:46:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:56e1:adff:fed9:caf0?
 ([2001:b07:6468:f312:56e1:adff:fed9:caf0])
 by smtp.gmail.com with ESMTPSA id d16sm30412628wrg.27.2019.11.29.09.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 09:46:13 -0800 (PST)
Subject: Re: [PATCH 2/2] Add -mem-shared option
To: Igor Mammedov <imammedo@redhat.com>
References: <20191128141518.628245-1-marcandre.lureau@redhat.com>
 <20191128141518.628245-3-marcandre.lureau@redhat.com>
 <20191128172807.788e6aeb@redhat.com>
 <CAJ+F1CLZxhMf-bOAB4sVfuB1yaUMqiO70-ogpKVS3CqfC7y5KA@mail.gmail.com>
 <20191129110703.2b15c541@redhat.com>
 <04dadf85-cd35-fd37-9642-8087cba625bd@redhat.com>
 <20191129131652.6683b769@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <528bb183-3d44-e541-8765-9c0e01f23157@redhat.com>
Date: Fri, 29 Nov 2019 18:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129131652.6683b769@redhat.com>
Content-Language: en-US
X-MC-Unique: k5upyYCpMGenXqCLPQ3Lxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/19 13:16, Igor Mammedov wrote:
> As for "-m", I'd make it just an alias that translates
>  -m/mem-path/mem-prealloc

I think we should just deprecate -mem-path/-mem-prealloc in 5.0.  CCing
Thomas as mister deprecation. :)

> combination to appropriate '-object' for '-machine memdev' consumption.
> That should cover compat purposes for old machines and the rest of
> -m options (maxmem/slots) would be aliased to appropriate machine options.
> 
> That will allow us to get rid of ad-hoc '-m' parser. After that it would
> be possible to deprecate '-m' in favor of machine properties, but that
> probably will get quite a push back so unless I find compelling reason
> to do it I won't care much as '-m' would be a lightweight shim over
> machine properties.

Well, deprecation and ultimately removal is always a long path.
However, I understand your plan better now and having "-machine memdev"
makes sense if you want to also move/alias "-m maxmem"/"-m slots" from
"-m" to "-machine".

So ultimately you'd have two ways of configuring memory:

- -m N,maxmem=P,slots=Q
" -machine memdev=M,maxmem=P,slots=Q

Paolo


