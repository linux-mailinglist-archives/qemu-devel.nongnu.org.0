Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9323195
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 12:46:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSfoC-0003aX-7X
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 06:46:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hSfmg-0002tw-IS
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hSfmf-00079R-Hh
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:44:46 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hSfme-00078m-Qn
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:44:44 -0400
Received: by mail-wm1-f65.google.com with SMTP id j187so12516914wmj.1
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/oUmBkKPs3ZU9q80S5QegbLEbdX8euAKeAEhPEwHgUg=;
	b=QlTwTeyFOBe2soWaYHNhdrRgejPfpswuSlT8encKkJWgFxGZHfYj8tnJ9SI9793g0T
	Bbcef7ctiMIYjTSbb0HAhJg+7D7I0LuOVFK9FLHaj0vLD2LF4AJrh0YWvC6BFIXo9oXi
	gT78VeXcraFqEvFznVFuuLN4oQyRMWiC5Jz/EAfvHjkZa/Ekmxpz8me9T7cgyjdngb1I
	c7ai9+knw3JIsuER1F35tXos5GPFFnS33tY/p/BTVI4Zr5fB+qLf6/F2hPUXwwNLTMt5
	0lXKfRS1vdVX0isB0YfYKoxvpqb+ca46laYGV5rr6zkWU3JDj8XisghawYDNL90OqorE
	gmKw==
X-Gm-Message-State: APjAAAVa86cKBlh5JWW1GwMIIy/wVJm3Hdr6K3d/1sdEv0S6KNuqLrkg
	h9YelGqxgXDBw8PYznCEfKrNqQ==
X-Google-Smtp-Source: APXvYqwGt6jVntAqCyNs4JTD8t66tgZlifhv4XIMyqZ03I1O7xbN5k1btWT0h3ie8FoXWJEKJye0TA==
X-Received: by 2002:a7b:c053:: with SMTP id u19mr39270588wmc.63.1558349083829; 
	Mon, 20 May 2019 03:44:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac04:eef9:b257:b844?
	([2001:b07:6468:f312:ac04:eef9:b257:b844])
	by smtp.gmail.com with ESMTPSA id
	i18sm8469143wml.33.2019.05.20.03.44.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 03:44:43 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20190520030839.6795-1-peterx@redhat.com>
	<20190520030839.6795-15-peterx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <77dadc30-fa3f-0bde-88f5-4f766bcd026e@redhat.com>
Date: Mon, 20 May 2019 12:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520030839.6795-15-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v2 14/15] hmp: Expose
 manual_dirty_log_protect via "info kvm"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/19 05:08, Peter Xu wrote:
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hmp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hmp.c b/hmp.c
> index 56a3ed7375..f203a25740 100644
> --- a/hmp.c
> +++ b/hmp.c
> @@ -102,6 +102,8 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
>      } else {
>          monitor_printf(mon, "not compiled\n");
>      }
> +    monitor_printf(mon, "kvm manual dirty logging: %s\n",
> +                   info->manual_dirty_log_protect ? "enabled" : "disabled");
>  
>      qapi_free_KvmInfo(info);
>  }
> 

Same here of course.

Paolo

