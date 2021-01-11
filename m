Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896D2F19A0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:28:28 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyz7L-0001aA-En
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyz6I-00016w-Sg
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:27:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyz6G-0005HT-M7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610378839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWmp5p5HW3bX89giZ83eL0UD/+5fdN1KatWUqH7BhT8=;
 b=RI/DagMY96mA6MyFYqOfNyn4+MgpoRhmgyO79keDglCwyOJBOhOs4B/KLw1dAf29QTday0
 Ipcdz92rMlnoJiaD9uSNbRhKBh3w0QzyPuLITuFTCZQdkT5jDc9NfgaGUPVjZUMRC0CoJu
 BLGFZWTEj7HZdx5PD/aS3hXR59dex/Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-FrGRZEC7POukMF2qd9f9sg-1; Mon, 11 Jan 2021 10:27:17 -0500
X-MC-Unique: FrGRZEC7POukMF2qd9f9sg-1
Received: by mail-ed1-f72.google.com with SMTP id z20so8340991edl.21
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jWmp5p5HW3bX89giZ83eL0UD/+5fdN1KatWUqH7BhT8=;
 b=szJBiY3egDAhrBZQWoMxq4sc2NQIiqgIROuiw6o8DEKr9NkJteJy/pwVlB4HaGRpfl
 UFR7kvDUYNAwmRG65L69nKisPsHZWkgg/K3QF+0w+7i4UVrJKG52h8cCV3Djsh4KQTHp
 CL1RPNJDh6xeK8m+HVyEaoo6MMz2ujAV3V1MvfqNznyNXEqS/llALlGIwsaHMwT3Hw92
 qm65Pm5IK2PdMpTIw0gZT4w9Sa7AizoXhGujYvgK/kN4jOSWIds2dxUqyIs6HlPl1dsP
 ErZcNN/YzX/C3/D/j1IL6cvAx5uEV90vKb+GSChd4UCMa/wPLSHxouLl44p58yafTdoy
 Gx3w==
X-Gm-Message-State: AOAM531EC1W553/ERN2IGK8OILyFwmj/rhd/EzOnMfEMmfxLg0tSDkET
 p0zGCJZBhzWUv7a6wqNM6nNpcwN64K9wq1Hc4/uVrYqMZmai8uhwFXn/jid43/g0VRgNIHea4pj
 BujFMycsZ1if9ys549aG6xMDQXYv5+3vpSkCuqL1CDDYWnTk2MVDO983rxEaJF+Wm
X-Received: by 2002:a17:906:58f:: with SMTP id 15mr1321ejn.67.1610378835531;
 Mon, 11 Jan 2021 07:27:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFuXAa7jFcLaP7Yie6nz48hnnOzw1ssOp72bm2xvZkwJBxAs7568esV9JP/09cuQJBqp3TvA==
X-Received: by 2002:a17:906:58f:: with SMTP id 15mr1305ejn.67.1610378835332;
 Mon, 11 Jan 2021 07:27:15 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id k15sm7179936ejc.79.2021.01.11.07.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:27:14 -0800 (PST)
Subject: Re: [PATCH v1 02/20] test/guest-debug: echo QEMU command as well
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <77665589-58a6-5746-8fcb-443e7a5d90d4@redhat.com>
Date: Mon, 11 Jan 2021 16:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 11:42 PM, Alex Bennée wrote:
> This helps with debugging.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201214153012.12723-2-alex.bennee@linaro.org>
> Message-Id: <20201218112707.28348-2-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/guest-debug/run-test.py | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


