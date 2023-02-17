Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43569AE4B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:48:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT21p-00047s-Si; Fri, 17 Feb 2023 09:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pT21n-00047U-FF
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:47:59 -0500
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pT21l-0000Kr-Lp
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:47:59 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 260032499
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zx9zQ6JamL2YwqHXFE+RaJclxSXFcZb7ZxGr2PjKsXjdYENS0jRRy
 zEdWz+COPiDNmT9KtEjaty38ksEsJOAzdMwHQtorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8rWo4ow/jb8kg35q2t4GlwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj6+ROIlg1O48iw99uPmATz
 KY2KhUcKR/W0opawJrjIgVtrsEqLc2uJZ9G/385nGCfAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2M+PXwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTaLlFcrjOm8WDbTUtGte+dKwlmGm
 mz5uFTYXjJdNNCVyRPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMy9O08rR36CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdFFattPROWBcKeAEX
IronPort-HdrOrdr: A9a23:NBAPT6Dgqi5ThPTlHemw55DYdb4zR+YMi2TDtnoBKyC8EKSj/f
 xG+c536faaslossR0b9uxoW5PwIk80l6QV3WB5B97LNzUO3lHHEGgI1+vf/wE=
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Feb 2023 09:47:53 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 d15-20020ac8534f000000b003b9c1013018so699798qto.18
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hBwfNylEpMx6oLtHR3VvnSYQfgTkpE8YwJ3Lk/bna48=;
 b=NUOEWPmz5TwW5jrEnrvYP3kalGh5dFQKI/SqlxecnsLEOwsv/co8GtD9WibMTKqo2N
 bArdcwCtJpqcT/gRdU4+tvby+mzPDpZQqq8mhXcUDTj6jRYrBOzhp+IWJ4aV9epXtf5p
 ByV+baC8ZMDRf8EmNOiF3z2XZQZk9CQpxRk0rGhDMoFr2uwAxsuv167o9FZa3RliMV6S
 s0167uwIynQIjhpt4lG7qcgkTcYQYxfM6QrTLge3J87ABxDswZ3SRbdjcLGEWO3vtsWJ
 iJr/0CFYabMpUEPfJijCOuk/zCoF9Y3XIl+QvH/H9X0XLtZcqIuGN1UKD/FS0ZC4HkLS
 D+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBwfNylEpMx6oLtHR3VvnSYQfgTkpE8YwJ3Lk/bna48=;
 b=SwPjuii4lpph6a106H4Z8fiNkWlZkRM6KT53sdq4aRSHwkzc3818PoSqxv83PAe9EA
 uuGCaUbEp7eFNdSgfOylu/gBrPVyNdDJEoujCBSBB1mkKtWuPmS9g3viGqtRoL7a94H4
 0uOq3CaJE2fPoP8y6rDGbRxomtzpk59sGMizbaKw++gZTGxLdKqgaf0tQgoMVJpLRmtQ
 0SMBJidWgjlvppHpTgVMd64qtxZZRaOXE8FME4q0xhO4PVXKESdUAKI1FaM7roePcvok
 WfCxZ0BpzvqkbcLIV+naTk+sdF9uRgKRkLDY+WV66zYRWXUibIWPUhSogJTwJNv02Kqq
 1B8w==
X-Gm-Message-State: AO0yUKXb9fy17oTJAGvLJCjz7nKq7/85fyassrMZe2/tEgw6zZIAtcQt
 yEQxheACSVYh5DAbVVVmLGzY4qtv9lL2aTyBR5Yjdc7yqARfA/aydPWTrUA0MEeoYRZyho0+Kr1
 8p04Wt4mqmYdz2a9ThUL0sUUhz8es5A==
X-Received: by 2002:a05:622a:44f:b0:3a8:fdf:8ff8 with SMTP id
 o15-20020a05622a044f00b003a80fdf8ff8mr15609772qtx.36.1676645272740; 
 Fri, 17 Feb 2023 06:47:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9LVNokrv86B1gSDE2NX5mKCH8kfjnVDfq50ZFa0e7jly1YSDHUJxfgOK5TbDxBXuE5b43COw==
X-Received: by 2002:a05:622a:44f:b0:3a8:fdf:8ff8 with SMTP id
 o15-20020a05622a044f00b003a80fdf8ff8mr15609748qtx.36.1676645272440; 
 Fri, 17 Feb 2023 06:47:52 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d123-20020a37b481000000b0071f0d0aaef7sm3374767qkf.80.2023.02.17.06.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 06:47:51 -0800 (PST)
Date: Fri, 17 Feb 2023 09:47:48 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Darren Kenny <darren.kenny@oracle.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PULL 02/10] fuzz: add fuzz_reset API
Message-ID: <20230217144748.wre2q3unrdbvro3x@mozz.bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
 <20230217040855.16873-3-alxndr@bu.edu> <m2cz68efem.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2cz68efem.fsf@oracle.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.634, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230217 1048, Darren Kenny wrote:
> I know this is a pull request, but if you prefer to have all the patches
> with and R-b, you can add mine here too, but I'll leave it up to you.
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 

Thank you Darren - I missed that this one wasn't reviewed..

