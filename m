Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3DE66C9F2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSnp-0001rx-DN; Mon, 16 Jan 2023 11:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSnn-0001rC-FV
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:57:43 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSnl-0006nU-Tt
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:57:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id r9so5293698wrw.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TMCsgHb9T15rHyW+to8MH7VmOcCIfrFIsedcj/KsO0A=;
 b=TwKAYGJpH3M6GyhRZzrCpbo7eflHV4QG07zglv0eMqYoJRWeqsHwxspYqrzQRyFWOm
 JlsIlF3ayikpaNMV4bz7tE2Fvi/wcvvZpis8RIwDlxlJ2FOqt1Xt05R9W9I4ktkI6K1r
 Gqs2TJn66y7o5SzsjQy0uDuHISNZTm57jqzOOXps+eF49Eg1aczsj9YGhi7b+xSSi8Y/
 BO9pR2ydJL74S5fcpbVIus8h4igiwFCHTcDjgXWrXbv/bDaKAROMYr5NBzcmKEG7kny8
 NSaJoIFyztZAR3LtCa8gChZoLcJiMAU5oblu5nQ+fbYY2gi+8dMv7l85on5sSpmLm0JG
 EuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMCsgHb9T15rHyW+to8MH7VmOcCIfrFIsedcj/KsO0A=;
 b=fKiTs92zxPPQRrO3y5rumRImbu5likbzMmLW/pytLRqeXNqjQf29uU6qrGXP1W1J4Q
 ciXzxKU24luz7W0fY11JKpSEidBYgHsgLdEef0MerVxdzU3BFdpLM8tUaxDE6ne8KPs0
 pLFVOMmMNUq+xg4mSS1bxWotPX3YEU1jfmM593q0PSF0+dzuHjMZi3Wbe+UN3tv3mRXB
 U15q+3Txy2AAwtg8fMihYM/MpOxalj4lFqpcBAbg1hpYmVaUfe53hH7WByCh6L3Q2LYF
 +M/3w+vo/dPZGEhte5mR3sYt5KO9MfGgrwSD8zLEG3Wq1v8EcTek8CVYEmqSPaZit0AF
 QMeA==
X-Gm-Message-State: AFqh2kobYFfOvWmdXQ62Ut8+y/RdQ+sYgOv3LEHOEUL1oxiXOlFd03cD
 N6+Pu69D/QL+0QkB2p9L9Ag=
X-Google-Smtp-Source: AMrXdXvpyQo6mo26021xX8BFBQmjmmgIqe2rbx5WvVDB1mMWE9TfPuypmFHdPiIToG5kN5jJHqAxgw==
X-Received: by 2002:a5d:608d:0:b0:2bb:cc51:7617 with SMTP id
 w13-20020a5d608d000000b002bbcc517617mr150726wrt.42.1673888260212; 
 Mon, 16 Jan 2023 08:57:40 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm26758356wrb.107.2023.01.16.08.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 08:57:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bb0e0fae-8bc8-cf11-23bf-04660a560bc4@xen.org>
Date: Mon, 16 Jan 2023 16:57:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 13/51] hw/xen: Add xen_overlay device for emulating
 shared xenheap pages
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-14-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> For the shared info page and for grant tables, Xen shares its own pages
> from the "Xen heap" to the guest. The guest requests that a given page
> from a certain address space (XENMAPSPACE_shared_info, etc.) be mapped
> to a given GPA using the XENMEM_add_to_physmap hypercall.
> 
> To support that in qemu when *emulating* Xen, create a memory region
> (migratable) and allow it to be mapped as an overlay when requested.
> 
> Xen theoretically allows the same page to be mapped multiple times
> into the guest, but that's hard to track and reinstate over migration,
> so we automatically *unmap* any previous mapping when creating a new
> one. This approach has been used in production with.... a non-trivial
> number of guests expecting true Xen, without any problems yet being
> noticed.
> 
> This adds just the shared info page for now. The grant tables will be
> a larger region, and will need to be overlaid one page at a time. I
> think that means I need to create separate aliases for each page of
> the overall grant_frames region, so that they can be mapped individually.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>

