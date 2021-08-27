Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C283F9488
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:48:36 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJVf7-0004Kv-2T
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJVdE-0002Cp-Dc
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJVdB-0003ov-E1
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630046784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaiNbsTnDiMoelfOI92WglYxDboJmDaviwsHOxSqXOw=;
 b=ixsvv+ffC8WDrNAovWez8O7407hxVh6mNLxCnhwC1CENzgKpFb2LEIeBhqXpKvLPRwxSKt
 KxktvZxE1YcEAj0e98AHEK68ZdnN/1pvOyw13ebLCU08VysOoy2g76/sGZLO08yVp3+B3H
 A6kCnS3A9knC5Kbz1z3cMISA4Gf6nOA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-FChCxIkNPQi1HAlPZQPebA-1; Fri, 27 Aug 2021 02:46:21 -0400
X-MC-Unique: FChCxIkNPQi1HAlPZQPebA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so1711891wmc.9
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 23:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qaiNbsTnDiMoelfOI92WglYxDboJmDaviwsHOxSqXOw=;
 b=aIWNifdQJ+oEoqMy2V8Yjs1AWz67hQxGbcG5HgyZBwnypLwWW5RXSFddrYyffn8+zi
 seeYB0lwAj1NdqU9puS7Dij15GGYwuyZghO68Xr6w7haxu5jatR9No9a04ujtvnzZmud
 DFW6XBTHs4QxcNpAe4QQDDnyJjmO54xYug+bpXMgJd0SNQgGfU0ODQjM0IkV4p2mFfm0
 7S5HlzSJpz3+0DHwt5sqQdVsmoh2+i48D7/PMTsC7l4KKv/iqtpnBfbGfSi4xAJgdLHG
 pi4uT+AfC+igdfhhrJfohpqeqQiOOBzIlXrmU0UA0bxpo0Y/uRrs/DoQftNfjTNX+utr
 ZVZA==
X-Gm-Message-State: AOAM53263EOEMn1zjEut8I83E8rEO1btbi8WNCg1sckMmi3WsuKbmf7f
 cFk5w6gTGVMDCBFTSX3xkQQ1/9P/qSDbUc5jQT6ybHnqxQhED4/YqjhzZC/2pfrUJXyHe2ZSG9w
 6g89rBMZBTo8hkdk=
X-Received: by 2002:a7b:c387:: with SMTP id s7mr17489143wmj.26.1630046780270; 
 Thu, 26 Aug 2021 23:46:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytMln0fX3mCiNuAYIW7eJNrmhDwzvNl9y1VorKHwv7P91VHzwJZwvwv13sNPXhdhlEvlt9Ww==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr17489126wmj.26.1630046780091; 
 Thu, 26 Aug 2021 23:46:20 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-148-182.46.114.pool.telefonica.de. [46.114.148.182])
 by smtp.gmail.com with ESMTPSA id z19sm11920427wma.0.2021.08.26.23.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:46:19 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] tests: Remove uses of deprecated raspi2/raspi3
 machine names
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210827060815.2384760-1-f4bug@amsat.org>
 <20210827060815.2384760-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b3ed0ad1-f3b1-0178-7145-dfb1dfed01cb@redhat.com>
Date: Fri, 27 Aug 2021 08:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210827060815.2384760-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/08/2021 08.08, Philippe Mathieu-Daudé wrote:
> Commit 155e1c82ed0 deprecated the raspi2/raspi3 machine names.
> Use the recommended new names: raspi2b and raspi3b.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   docs/devel/qgraph.rst                   | 38 ++++++++++++-------------
>   tests/qtest/libqos/qgraph.h             |  6 ++--
>   tests/qtest/libqos/qgraph_internal.h    |  2 +-
>   tests/qtest/boot-serial-test.c          |  2 +-
>   tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---
>   tests/unit/test-qgraph.c                |  2 +-
>   tests/acceptance/boot_linux_console.py  |  6 ++--
>   7 files changed, 32 insertions(+), 32 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


