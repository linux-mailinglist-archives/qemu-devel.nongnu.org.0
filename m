Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9FE310DD4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:25:11 +0100 (CET)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83uw-0007Ip-SK
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83tQ-0005yV-3f
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83tN-000504-GX
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbGy7tn5cRvax/Myyhp6tb0Rz1d03HuUm9SH5JiiMts=;
 b=FpyV82WGfWPlM5qVGOLLYOi/q4ZIfD/SqYh/m7iDt6vGOia6p7dyd2aQ7a5w5NeIZXVqDT
 sqY77D3Q1Zminul3HM+1A4zVDOUio/4l4UN3RqEd7eQVQJMdAkL/ihFmmLbuUnV7rKGAbf
 CKMtxsKPqZZLgAiJDwuaduiQB1Nz7BU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-0H1Gt9DrMgK_jGwAnug-PA-1; Fri, 05 Feb 2021 11:23:30 -0500
X-MC-Unique: 0H1Gt9DrMgK_jGwAnug-PA-1
Received: by mail-ed1-f70.google.com with SMTP id bo11so7233031edb.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AbGy7tn5cRvax/Myyhp6tb0Rz1d03HuUm9SH5JiiMts=;
 b=fuOOJz2Mzhh+4rx4OHqoh5suKnSIDJHxKmxmf2iflYowSF45JgyuihXHOnTfTCbdEU
 P8yzsbmlriFPDpuhC0N01wdX3MuluCXNWQDxRahNIoy5G325PWB8Rpk7BhTH3lSNG9pk
 tU21qZqQBFH5UtUQeLs6BCV6uy+3Hbb3CsRUP5pKH5MmNI/qOlH9W0ljlhSevldwT9hN
 gLT9Wm2SuW5Jcbd8FrPlShtjAqu1AxOysUav0N9/RisEpT/+eRPK9yaP9S3oWACSpVUn
 zcUHjEbvzMD8SQZFM4Rzc8o0YCdnX1xiywz8VIWEgLUDd3lQmu4FhZe4U+qdJuKPyXQR
 0QrQ==
X-Gm-Message-State: AOAM530/9bRW//S3KyE8K3g5GBMnYDvDYjA3Xebo6J4eeOVBXxWMWZzT
 HtTGjEEUwZ3bj5ph+p0C6IUI0787UwsehW50K/pHg0e1emxm9EkD6zdGSZsNjGvMx44spbECZZS
 1ojkKEYFX2wrQXbU=
X-Received: by 2002:aa7:c58e:: with SMTP id g14mr4389385edq.318.1612542208038; 
 Fri, 05 Feb 2021 08:23:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6iWfcVvCcjg79ED0FTsHgo1aCGOmZbu7pJDDhWiA0Ytks+wJpYNZU83yN5zejOU3szh5v5A==
X-Received: by 2002:aa7:c58e:: with SMTP id g14mr4389382edq.318.1612542207929; 
 Fri, 05 Feb 2021 08:23:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n5sm4238432edw.7.2021.02.05.08.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:23:27 -0800 (PST)
Subject: Re: [PATCH 13/33] migration: push Error **errp into
 loadvm_postcopy_handle_run()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-14-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e0ddcf32-9462-68f2-8627-d2be9e673d09@redhat.com>
Date: Fri, 5 Feb 2021 17:23:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-14-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


