Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EE3A5F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:47:55 +0200 (CEST)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjCE-0006Fl-B3
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsjBK-0005aV-97
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsjB2-0002yN-RM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623663999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SOQR2akHgCSjNAXDAfUOiestNHJHwyEGcnvkfcZwzN4=;
 b=QuciYvLuDy6AOGhm+TT8pZQ/QRUyz1CY8TYy3gJAzvlWhvl2LdJu5ykQe+t45Gay70Kv2n
 yGQmELUj+re5GIO8KaZDDoTE+2+S+lIPztXeGviULZwx20rxKvlx96wjFxyl5YsxWb7PRH
 8zK2eHQ2HuN05HDOgTqm+tz6ffjugN4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-PLjkZoNDNbK-9t1wx5CgiQ-1; Mon, 14 Jun 2021 05:46:38 -0400
X-MC-Unique: PLjkZoNDNbK-9t1wx5CgiQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t11-20020a05600c198bb02901bf95ba8642so2331548wmq.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SOQR2akHgCSjNAXDAfUOiestNHJHwyEGcnvkfcZwzN4=;
 b=BHNMg06WdFsXF4Q0hWFkZNSznap09lUXjSYO2WMtF7jS79HikuyzlppeqUnPcepL5X
 EBKIutvfv5cb0eB5dH2EN/RsSmRSIjsbjQCCLdYrVbHc1uOytj0O17naOzEnqJg6nEd2
 pW5itdsb1DNN6iHg2fIjzrFNZZk3iQWNjW/gJvRZf90vRESwPqLvbImBEPNUiqUiXXLL
 YwHxATHWDvhu2qvklkMxyZLfFPaFzLSE+RFC8r3CiHd91LjuYFvLypk4UG4lhzRmKM/O
 1BuKKvSp6HlMYPKQPuB+8RP/29dW5DxLddNJ6vNXPDoOoYMhsFsYUNFQ4tnoEqxqi5L4
 kOPA==
X-Gm-Message-State: AOAM5306wucQgEsGoAGmyNMEA0hjKuCBy3H72THzz0YBmKnpQlmSmtHf
 Kt901JC08yz0C/EMSEaoiuTl2NVHwZxzJ8FOGctDKSqxZdpPfRIf72Na5afF3cc3LnZjK83TJXj
 3ytPLBd/hV7mKC3z1YGlrf5ei5WV+DlQadFmJpT66ZscY7Sf4kKOCfZKxWpEz459b
X-Received: by 2002:a5d:4f8f:: with SMTP id d15mr17377705wru.85.1623663996926; 
 Mon, 14 Jun 2021 02:46:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMNpjxfZZGeVTdhk8UCCzmwZkbwTyE8NfFnYWqn2MRIZVGaHHAyv0pZL5JqvZAECSWRpVxqw==
X-Received: by 2002:a5d:4f8f:: with SMTP id d15mr17377688wru.85.1623663996671; 
 Mon, 14 Jun 2021 02:46:36 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h15sm15617141wrq.88.2021.06.14.02.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:46:36 -0700 (PDT)
Subject: Re: [RFC PATCH V1 3/3] sysemu: Make TPM structures inaccessible if
 CONFIG_TPM is not defined
To: Stefan Berger <stefanb@linux.ibm.com>, armbru@redhat.com,
 qemu-devel@nongnu.org
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
 <20210612012102.1820063-4-stefanb@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f7fd2c96-85df-cddb-2618-ca60b6c15a00@redhat.com>
Date: Mon, 14 Jun 2021 11:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210612012102.1820063-4-stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/12/21 3:21 AM, Stefan Berger wrote:
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  include/sysemu/tpm.h         | 6 +++++-
>  include/sysemu/tpm_backend.h | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


