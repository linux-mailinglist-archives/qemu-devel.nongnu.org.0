Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FA475852
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:01:56 +0100 (CET)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSyp-0004La-6B
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSWq-0004qS-Bc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:33:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSWl-0000SX-4c
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639567974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Q+oGx65oFHZ0EgLgqOrHIIqPlfhDIrEicMq85Fjl1U=;
 b=CB47olqveFb4QI5Y7i0MHYQVyGAgQGKTStIlIvQF6vz0TWwdjiSq+TtrltItEMO5oKKb+F
 UTQME39ldMD4Y3+PoYcNUKzUG7p2pPCnPADYFYGpnzKblMKsK85mYGnRMJifU8UBaba7sK
 vW0guNFU41zyvwHHKnBJzzgBUnr1Lo8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-QMJerkzuM7ikI3MZuSlimQ-1; Wed, 15 Dec 2021 06:32:53 -0500
X-MC-Unique: QMJerkzuM7ikI3MZuSlimQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so5805956wro.21
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9Q+oGx65oFHZ0EgLgqOrHIIqPlfhDIrEicMq85Fjl1U=;
 b=odAahMHOwK0TwVuOdS8sYYjBNFqvtDNwqjTsPVrC59lK5qC7QaQDkPLZXU1DZll9zk
 G+DmwHwVB9NYf0g1ijbzfXxCtFL6YxthCbxSjU3OFDFNPnswwzDrdlq5kD7T4/UmMYDS
 yoqkQIiet7a8NbxMGSzkBfSu86igSScgrz1EuYagrbfGgOvwr7VwwqQwOrwH56dKM6+7
 AP06mw+L9eI3+pgqR8r0pcwleaVXXjoGIn8s/ahvGPDVTMl2WxpKJobBaqWwBzRlJmf0
 xJSceTp87XXSleHKB8oCQuvec0oPxaWVk0LMv8qUyDdVQOtMwn2Eu4TaAF/puMtkZjoN
 /Yfg==
X-Gm-Message-State: AOAM533nNDB01EFzIRIgQlEcT/Q+3lgyYPAzy8ug0pnldGd9zMTGrFLN
 81lX7RvMBkin95sFg76Wh6fMdKeFEfrvoedrKD81BRoRat6E7DmSPV+EpyntQ0j2jnhy69NnYSW
 DG2+Aw/X+EEWWvbA=
X-Received: by 2002:a05:6000:12d2:: with SMTP id
 l18mr3782085wrx.289.1639567972313; 
 Wed, 15 Dec 2021 03:32:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwb/3mbUyaXbeYqK91i5n/ARPlyEnQU3VuYKvTkMTD/0kAVbk5RqGl64a/J97y/WQTQMLCj6g==
X-Received: by 2002:a05:6000:12d2:: with SMTP id
 l18mr3782069wrx.289.1639567972110; 
 Wed, 15 Dec 2021 03:32:52 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l3sm1532895wmq.46.2021.12.15.03.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:32:51 -0800 (PST)
Message-ID: <3f98d986-bd10-8211-6d31-b32f12886ff0@redhat.com>
Date: Wed, 15 Dec 2021 12:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 17/18] tests/docker: fully expand the alpine package
 list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-18-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-18-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> Add many extra alpine packages to cover the various optional QEMU build
> dependancies pulled in by other dockerfiles.

Typo "dependencies".

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/alpine.docker | 58 +++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)


