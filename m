Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0E542694
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 08:57:50 +0200 (CEST)
Received: from localhost ([::1]:41040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nypdV-0007C7-CR
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 02:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1nypUp-00018k-Tf
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 02:48:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1nypUl-0006iR-79
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 02:48:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id e11so17542410pfj.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=itOe94WIOKW5X8AnnTxqCuhqO0DkqS27nUmaeLZxTn8=;
 b=HWttiNmd5hB1tMNFS59F1s2naJt2WRCvQ/hwyEtXavanMCTI9YBnLtr6iZc08RIECv
 qfawZcfmoFqH6WxgMWvQuh2EWkRMRzHd75slvNw3BEVsA0lv516r+pIqdIpdeUTa/0uA
 3QeHYlAVAjsQKVJRw4FFf5D0GKvJ4/ohj4TSiDeTxoNvZClEkopn59lwtc0t7XlinGut
 p2qKLjA15oOyR6eH3/e0nqrF4oCmsd4ffBGaWhXl97md0qyKo/UNsUhaP/COX42qhdCe
 WQTup4REWDBeq7NwueFQg7eGitvwzT/3LkYYDmwBG1QeJORFCt6uNw+9mfIWm6VT4Bhy
 kOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=itOe94WIOKW5X8AnnTxqCuhqO0DkqS27nUmaeLZxTn8=;
 b=PR2KrBxI+hCi36AIloC1Gv5pLMjTiCRJEiuUOZF67fBfFStjRFlHKu7MT5hpV/hTAs
 sx3NEOS32QmxIa6JZ3A1ERSWl+GcvrwqfeigRBXlrHgLY7LWdO0AD2Y/yzsZUxUMMjtJ
 L7IFuNJOO7NS+PVYtpw7/qFJxD77sbHpfRR6arNTno+li563HkzSdMcn8uelje0a2aJ5
 TY3XFs1TrsjB1LrI6/X0kKlykd1qKx4nj1pml1sDh/IRvpx3+myC83cU3IMPGuxtpT5h
 BC1zemBxRi89m0VWxfHceenOZP3VTvEmtsqoaMEPMdNbEzykoJyWnt0bukBsyntz6Ee2
 igGQ==
X-Gm-Message-State: AOAM533RXyUMy83kN2CUMKUjCafvEhb4yG5/xeb3MH4IjaAmtn9y+SrS
 Ayc2DrG/SGn1LeouFbcinO31Yw==
X-Google-Smtp-Source: ABdhPJxOYIW6p7zvbei1BJx2UHduK+w0YsXdbqIrdKkVYwt/5FOUs8SUsojVC953yAodQcvoycbKGA==
X-Received: by 2002:a05:6a00:14c1:b0:51b:eed4:c571 with SMTP id
 w1-20020a056a0014c100b0051beed4c571mr22972212pfu.72.1654670924778; 
 Tue, 07 Jun 2022 23:48:44 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b0015e8d4eb28esm13794623plb.216.2022.06.07.23.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 23:48:44 -0700 (PDT)
Message-ID: <8eb53a3f-79ee-cf64-96b8-96719082b826@bytedance.com>
Date: Wed, 8 Jun 2022 14:48:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
 <CAJ6HWG447LyNpwwZJ_bYsT=MzY9K3mDwJ_Bh6EnGs0Cr7NJvYQ@mail.gmail.com>
From: chuang xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <CAJ6HWG447LyNpwwZJ_bYsT=MzY9K3mDwJ_Bh6EnGs0Cr7NJvYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/6/8 下午1:24, Leonardo Bras Soares Passos wrote:
> I will send a fix shortly.
> Is that ok if I include a "Reported-by:  徐闯
> <xuchuangxclwt@bytedance.com>" in the patch?

okay.

Best Regards,

chuang xu


