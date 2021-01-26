Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAF3047F6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:16:27 +0100 (CET)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4TpB-0006Ag-0I
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Tlh-00052r-FB
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Tld-0005a1-EM
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611688363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSwY58aPgKmsogfO+3+HdrAo7mfo2TZbgEfTEh5jo/Q=;
 b=OYz/WyJsa7xPBkEiU8wPjE2bWnGAkkoTckpyR58Ndudq3F+PKgXhnCPP/EcfiIk2P60L1m
 IYZ645x2+PHGEuVy7eY5ZuVJuAMJybPKGSsPC9X+rFkxXxsqvfViYEWUcNPtd9y+JGeTIn
 H/KXZTqw8OBJx8F56qhCFI5sD05Ttaw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-aSDEJ5vSOa6FzoPo3Bbubg-1; Tue, 26 Jan 2021 14:12:41 -0500
X-MC-Unique: aSDEJ5vSOa6FzoPo3Bbubg-1
Received: by mail-ed1-f69.google.com with SMTP id x13so9887083edi.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 11:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kSwY58aPgKmsogfO+3+HdrAo7mfo2TZbgEfTEh5jo/Q=;
 b=P9aohdidGPRyMreVpCo3iWuXaTd73JueCnJ1Wr5P43IMz5AOw6JlBxgAYFKqfgS2Xa
 E5m2ANZK7p6CMFBOyiGFodBBYK2bLJALW9Dao6zzQfND3tNhTLiuD84e/bhKY9iWgQmF
 0S6/ZwcZfb4dlfU8pHnr1qypIXELRtQjIZyXakqMX4NWNSaej1utYkdOlKDkIR69OOB7
 jzj4HTrUJA8vy0Q2HMCvL6gdkLh4ujbCqtWQn+1xZTU/5XHLMZnsCcq6nyqE2ia1yUDM
 2g4s2Zs8+gLjFMboUu3ns8B0oPSAF0emnaGQ62keQNyeK9lXCIgesSV0f3JyKnS97yyW
 vZ+A==
X-Gm-Message-State: AOAM533en2iRwNxCK5JlaDP4ZDzRi2I5p0a5sV2FqhiPXLcbzFeYxNXv
 64lRZaTvQ2dOiMLn0BfFhsyLXEIfx7+ACW+jRWvkUjtUZfvm8ZM/aD0eN9fgC4S6A+irwRCe/SJ
 wtA85PG10fcPfFTk=
X-Received: by 2002:a17:906:d159:: with SMTP id
 br25mr4350520ejb.398.1611688360142; 
 Tue, 26 Jan 2021 11:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxbv05oc3qsBxHie9IlhxmRPBx3Z3mx3px/cUyIvYSzYhtfiRvi52/TuHMuegBDW029x6VNg==
X-Received: by 2002:a17:906:d159:: with SMTP id
 br25mr4350510ejb.398.1611688359989; 
 Tue, 26 Jan 2021 11:12:39 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id fi12sm10308645ejb.49.2021.01.26.11.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 11:12:39 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci.yml: Exclude some redundant targets in
 build-without-default-features
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210126172345.15947-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e3d1e7e6-b83a-aa34-d313-ac7c2658da91@redhat.com>
Date: Tue, 26 Jan 2021 20:12:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126172345.15947-1-thuth@redhat.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: cohuck@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 6:23 PM, Thomas Huth wrote:
> The build-without-default-features job is running quite long and sometimes
> already hits the 1h time limit. Exclude some targets which do not provide
> additional test coverage here (since we e.g. also already test other targets
> of the same type, just with different endianess, or a 64-bit superset) to
> avoid that we hit the timeout here so easily.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


