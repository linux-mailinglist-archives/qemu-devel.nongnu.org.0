Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5A3402B3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:05:26 +0100 (CET)
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpWv-0000cu-TZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMpUt-0006ek-HV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMpUs-0005iW-1l
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616061797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBJOSOEbpmYu50vyurMdtubXcstbjpVpBOj5KFSq0xk=;
 b=MgvpAjxOItkzZKTG9/gxHcsby0oRsHfobwkrhJSaQZBInr5weyjym8au0P+Stkkt/XjcU5
 JC4/HU2xVh9H7RjhynrjApjn+FzDdfLZnTFcQiAfBSR/jXdlu5NShjuz1vCvIyQBw9+or2
 DWPH1X8Lpo+pK1Jigsq99PkIqJrOc44=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-CeL4pdy1OrWOdoULMPBzDA-1; Thu, 18 Mar 2021 06:03:15 -0400
X-MC-Unique: CeL4pdy1OrWOdoULMPBzDA-1
Received: by mail-wr1-f70.google.com with SMTP id p15so19675817wre.13
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zBJOSOEbpmYu50vyurMdtubXcstbjpVpBOj5KFSq0xk=;
 b=IeDnoaVlolR/d1lNqRxiKXrOVwV5ovnKGsMhvRFuPQ+MKCPJBp+E2kwBmPLhk6BQ8h
 M5b2/tYtumxogiWfZ8B7BvRZUc7uFYfQ7twHv6KtpD9XnPtTIb3V84sJrAod4VWuzk3O
 qWWwtXOJ9HF6bgYXocSPwqtfsoXsVQFFr1ykmhFuKf1aYknBwgbBMrMinc95LinLhiZz
 wKzWnuAD+rpGgDEbyaDExTN78ZoTNfBB0MsPBV8s/Q3IE8qaPpL5tNOtRvBERsxjwPFM
 P5O65+yPfTPtfsAxFt3T88WBcj0MSR+bvFDbPC8wZi9rV9X/OKZEHFQI7En2leT+VzTY
 KosQ==
X-Gm-Message-State: AOAM531KVZ492ZId6HVYtb7InZCOywZS/MKhjBvGkg476awFqVjT4XxP
 +gJDY8IiMIsn0ZVdr26VCQYHgAVY7r5MqLZY2dF6WVYYKoHKcy6LaY8zdmhfaYhelqGuSdStgdA
 +5uA49I1m8snGik0=
X-Received: by 2002:a05:600c:2946:: with SMTP id
 n6mr2820278wmd.52.1616061794408; 
 Thu, 18 Mar 2021 03:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww+t2YfMf1PJtV1EXP72LjXVwuFYnGK0JFS9IjJJzT0hGU+QwlVQjlKcA5eWOfsELjohYx9Q==
X-Received: by 2002:a05:600c:2946:: with SMTP id
 n6mr2820253wmd.52.1616061794191; 
 Thu, 18 Mar 2021 03:03:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i10sm2189467wrs.11.2021.03.18.03.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:03:13 -0700 (PDT)
Subject: Re: "make check" broken with everything but tools disabled
To: Claudio Fontana <cfontana@suse.de>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel@nongnu.org
References: <877dm7jkib.fsf@dusky.pond.sub.org>
 <42de1769-e1c3-0486-b434-88813aec8ef4@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <deaed0b0-6f4d-9d1c-239b-98e4f7bdd496@redhat.com>
Date: Thu, 18 Mar 2021 11:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <42de1769-e1c3-0486-b434-88813aec8ef4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 10:16, Claudio Fontana wrote:
> my experience with the new build system (meson-based), is that I have to do:
> 
> make
> 
> first, and then
> 
> make check
> 
> later, or bugs start happening

This shouldn't be needed.

Paolo


