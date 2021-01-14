Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F32F6900
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:08:49 +0100 (CET)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0738-0001xF-4L
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06zi-00005y-57
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:05:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06zf-0004Is-Mn
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzL81cdtWndBgykY1yd0SNYZ06vViX75UELFy5ndwLU=;
 b=VoK9Tp+tPkuTUafGmFKo8qbNZYmO1MiNpZ9J5cU1LaBP+hI0+MyszutgIEk7ytt8sHwiBk
 S4fiIWgY0+h2gXuTdo5ENbp9c/fnrHzLpURhSbWj9m6SXvcLtucrxHWpvngrsfOosW2qeF
 EC60ZrMB5ZrAoZK8uGD/rVlcDlLjqMo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-asdRHbyAM3yBcgsRroRTbw-1; Thu, 14 Jan 2021 13:05:06 -0500
X-MC-Unique: asdRHbyAM3yBcgsRroRTbw-1
Received: by mail-wr1-f72.google.com with SMTP id r11so2935017wrs.23
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 10:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xzL81cdtWndBgykY1yd0SNYZ06vViX75UELFy5ndwLU=;
 b=aSHVDisWhSYUEOYlTkfCgQjtGCrjFxb1q4VAOSJcraQD3gQFmzDQJn0Yjfb/w+SKWU
 B6nZ8CGKchStNCKw53d5kE0Ewk1J8FqpYS+drKDCx3PpzjN1gHoZbixMeraiTkBJFkuu
 PedDi0LPdIBcC02+1aNeWh84RfUWZka1Q3BlI7ySd700aUDqY431EXe5H9U9iY9OyJ/d
 SxM6nWGQhmMRT9jMzL4Vh9Kp0M7/PzBpL8Jn3B3YXzXI7fc4Hi+C42GufwYZL0o8VcoK
 +7K2zdECUZ9rFxwwHwSBrSL7qKy4OXnAApbxUKDRoVphUZJ60BnNAwjOMtG7dh25GfZQ
 Aw8Q==
X-Gm-Message-State: AOAM533KkrUmcZT4j3BU09BO9UVkccMyYt65AWzW9hNLVmQNCSyuvold
 rRBrdJzJlum7yNkBz6AIRfGP7T35UCcK41OuDgRFAYQvpfvczAhqwaWiYDusj1dxU7GY/AlJo3j
 jgXSLJHce8Y3P/fR7lj2kVNouo7kCKDYYHR8ECem+BA0fVqPMc2tf4ii7m5885TOK
X-Received: by 2002:a1c:98d7:: with SMTP id a206mr5118909wme.2.1610647504591; 
 Thu, 14 Jan 2021 10:05:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5ieDKF/2gP3Wh2zv68GfFXN7XTp0/VA7bvKVQLXhqnV6/OSKG8gB1cBM50mQEJJHp7hKB0Q==
X-Received: by 2002:a1c:98d7:: with SMTP id a206mr5118893wme.2.1610647504404; 
 Thu, 14 Jan 2021 10:05:04 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u13sm11462593wrw.11.2021.01.14.10.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:05:03 -0800 (PST)
Subject: Re: [PATCH v2 12/12] scripts/checkpatch.pl: fix git-show invocation
 to include diffstat
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3dd29340-ca20-3a1b-6358-122448d8c1b8@redhat.com>
Date: Thu, 14 Jan 2021 19:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 1/14/21 5:57 PM, Alex Bennée wrote:
> Without this checkpatch keeps complaining about new/changed files even
> when MAINTAINERS has been updated. Normal invocations of checkpatch on
> patch files rather than commit IDs are unaffected.
> 

Nice!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
(with Lukas's path and yours)

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


