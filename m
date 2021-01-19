Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4E2FC319
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:16:05 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zIC-000698-Fn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1zG4-0004of-FN
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1zFx-0005Pw-U0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611094423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCYyuYJNDQT4eHXxwl1Sd9GNQzZX83OC2/ecHsF/Dq8=;
 b=AwFj5mLN6upL+5BlKPmdRipTVWmLpeweykdpFn7B+VVLb3TEngPKmTar1I9Z+ALmagriWa
 Xxw5jVgZtRQ9PPfnvlUkPTo+mux16gflQeQ3S2qfQmUBhSjtPe6Yv7/TbI564x+Ag15K/N
 eqXQcsfelLvCHLcvA8m8GiWgcLesBjY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-QCLWnxB1NHaqOjqFYx2Clw-1; Tue, 19 Jan 2021 17:13:41 -0500
X-MC-Unique: QCLWnxB1NHaqOjqFYx2Clw-1
Received: by mail-ed1-f72.google.com with SMTP id n8so8115477edo.19
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 14:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LCYyuYJNDQT4eHXxwl1Sd9GNQzZX83OC2/ecHsF/Dq8=;
 b=CIOilzDzX9C1/w/4+iZsGpYoOqBIy0flYRV/no8Ne7Yhif6p3v/i24qIiafHz07Bhl
 jU1LNW2gxRP2s6fvBRGr6GSDpvhOfTYQdKOwHE/eKSAkGtfiqJPPiZHSpqennyvUUZQY
 jw+8UOwmPieJtJmJ4RnHdO7MUpUb425MT5eedhCW34aQYhKkPilT2LlCMGxeEp2GbAyy
 QCYYCJ/AOe+rDHgCJxW7uFl8QnUp+4Z3rCLQgqS6UzojA5NAiOgc++U5gfv9ZwsX/qrh
 G3YWwsRizrOjOHy/FfGxW9/PxqPuD1+aLJaJaMH4LJoV0AfQrK70hhsNQj9va2k2vk5r
 H/5w==
X-Gm-Message-State: AOAM532gqx9x4JwaQPcrPhM7MUI526uZjEr/lQMgeOtKdauHKx82q3Rz
 sQrAE6xR5erR7as8rFup/dIAYET1m9cacPteMexsdViF2rYsijBVwYSnilLgB5l73ES4+9t9ZAi
 4E66oSYLmuw5fjuw=
X-Received: by 2002:a05:6402:b52:: with SMTP id
 bx18mr4912064edb.221.1611094420111; 
 Tue, 19 Jan 2021 14:13:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySbzKOzOjnvTxf8VCN84YRPi/FJXKUwbkjhGhP1xAAolI4f9uqjr6T3BTZRneEVFQWS3dSxg==
X-Received: by 2002:a05:6402:b52:: with SMTP id
 bx18mr4912058edb.221.1611094419965; 
 Tue, 19 Jan 2021 14:13:39 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n27sm68334eje.29.2021.01.19.14.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 14:13:39 -0800 (PST)
Subject: Re: [PATCH 1/2] qemu/compiler: Split out qemu_build_not_reached_always
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210119185542.628456-1-richard.henderson@linaro.org>
 <20210119185542.628456-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a4445d1-6743-697a-728e-50ae81f10801@redhat.com>
Date: Tue, 19 Jan 2021 23:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119185542.628456-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 7:55 PM, Richard Henderson wrote:
> Provide a symbol that can always be used to signal an error,
> regardless of optimization.  Usage of this should be protected
> by e.g. __builtin_constant_p, which guards for optimization.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/compiler.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


