Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F34301EE8
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 22:21:32 +0100 (CET)
Received: from localhost ([::1]:49782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3mp9-0002fi-CC
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 16:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l3mo5-00029X-Uk
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:20:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l3mo3-0005VX-98
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611523220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdcXEhn9Mw0ZPLdG7wlGQ81a/on+5I2/VgKskXyOt/Y=;
 b=JzCVs6G97NtLS3+URekQlNgu7TJjDYJ944e1SnhPueSRAmWfdmZFFaXqj0ihgMA67ilwK0
 j9s8bxtRxiMDh+5JlPOdyYbAQPSDkJbnhUQYN8i7iSXvIo1kktz7qdOJX00VzsMr2afICA
 yMfx7x8Sp3BZ+jWp9+4YHbXrBQFfp2k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-bl1AXTQAObWEy-y9TzDTfA-1; Sun, 24 Jan 2021 16:20:18 -0500
X-MC-Unique: bl1AXTQAObWEy-y9TzDTfA-1
Received: by mail-wr1-f69.google.com with SMTP id e15so5729024wrm.13
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 13:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PdcXEhn9Mw0ZPLdG7wlGQ81a/on+5I2/VgKskXyOt/Y=;
 b=hVEbCE8S48JiNLLNIQkVRab5AEQ84GD5u1n+Mg3a+lsxjIS6jcVu7d01dGDoQn9cHF
 PWWM1xaABKSRm7OBBPn7nOPNOYkHWbQEv/wjgC5cWowUB4kLwWmtxceZypq+Am5emYIs
 hARcRNiCIms/vBsWyr+ZEQWhTDOffmfhNQdizELjlJ8WiP+UU8sT8077eWfJYXYyHNtq
 zhHB4MjURv2PnsdRBPex8UTAFDx5O0cIcvJu6+aFHRFHl+cwlEbNgyoy3k9FlN1O3xWS
 YQ3XAjHTn82DOmWOtJ6VLnGjtYxVYP+eyqlzM5wD4NPlG3b6cKiiMcQAAljiawHB3OjE
 cwdw==
X-Gm-Message-State: AOAM531xQlIrteke3ZRRpbtlUcNRCJfsQBEz39R0aBSK2ejq5hzPBIMw
 Ch+MeZT5+fPPhU3M6ZDY7H2UdddpS3q6Z2Ar4HSNxpoyLhFrQRVyHr2E61kGrjiM9e8rhZcJBn5
 j3nSN9JWHNMaYMdU=
X-Received: by 2002:adf:ed49:: with SMTP id u9mr364344wro.292.1611523217771;
 Sun, 24 Jan 2021 13:20:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAeSmbqI5S+9w5dDSSPm9MbJCuI9ynq0UNDDcsXdZaSlIGfRW3io3kwLqioHw92oNKkcemnA==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr364331wro.292.1611523217617;
 Sun, 24 Jan 2021 13:20:17 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a6sm10540153wru.66.2021.01.24.13.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 13:20:16 -0800 (PST)
Subject: Re: [PATCH] configure: Fix --enable-tcg-interpreter
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210124211119.35563-1-richard.henderson@linaro.org>
 <d4c96584-430c-1f34-95a7-0d05808c9370@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21318b73-a3d0-1c48-5c53-4c85b4d51899@redhat.com>
Date: Sun, 24 Jan 2021 22:20:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d4c96584-430c-1f34-95a7-0d05808c9370@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 10:13 PM, Richard Henderson wrote:
> On 1/24/21 11:11 AM, Richard Henderson wrote:
>> The configure option was backward, and we failed to
>> pass the value on to meson.

o_O

>>
>> Fixes: 23a77b2d18b
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  configure                | 5 +++--
>>  tcg/tci/tcg-target.c.inc | 2 +-
>>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Bah.  Of course the tcg/tci/ hunk is unrelated,
> and snuck in with a git commit -a.

configure part:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


