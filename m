Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C043336B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:22:14 +0200 (CEST)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmG4-0005ti-UG
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmEv-00044A-KR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmEt-0005Gx-Ay
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pbnPZY3+TFZq2TV6rE/MWm72YicZVMPUpuBSA+dHb4=;
 b=ac3ULT7as7CFr/kreM/cvrHcyvrNg9aJ7y06/4P0btCgXI/x5UrO9yHX/0+tN7TCvsmTVv
 9FDK2gIj+Yl1mtZDedXPUYdvcwsV3BlmQQE59+sxzQ1k8lUJw4EGBC0Sib08z1CXtal2iy
 YBBmafQLptBegvWNNoaQxauGIRnBXj0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-5VHNT0KTNo6HW0sK82Vy6g-1; Tue, 19 Oct 2021 06:20:55 -0400
X-MC-Unique: 5VHNT0KTNo6HW0sK82Vy6g-1
Received: by mail-ed1-f70.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so13666885edx.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2pbnPZY3+TFZq2TV6rE/MWm72YicZVMPUpuBSA+dHb4=;
 b=lwvE/C9fTq5xV/cSyI4YAJdAj/48qC4TG7bkbJ60+8902GZzFxeYwrtDqzkl5JFLyB
 Yi6z/7AO8WoOKNh4P1g49faa618litVsdom1BB6W33W4Sc7Ue/T+Uq90QhfHVVw2gTX2
 b30mu8rUBCOgtiGGgHdfuXUll7F7Ce5g51jzjUmVtxWfMtMYQ0WHj9rC5NWlopy6eUYt
 q4L+rmcXnJrCuC4dY5J2MBZUwq9c8627ieX2Mc711FDNkrw0ZMGOCFLf6Nb/PBS4ikVj
 HiGAxGXJjx1m6R13QRrrkbQ8dW44PhF6/Zid7DDShHzj4VpfyvgIpuc0/5txzCJ8XRr+
 BUog==
X-Gm-Message-State: AOAM532Mdh7MwYGESR+kTUwVtGw/pcRMlsCA8lTvpWTLKGQbhPtZ72QB
 NFSX6rFnQV4AH8Sg34qKrQse+TZW6iHqUIGz92EYFH5NaJHN/GCtLyKZkDeaFZmZihvzMaGJYVr
 lpbwglDwABtve3BM=
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr35351443ejm.37.1634638854705; 
 Tue, 19 Oct 2021 03:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3g/ek8HXGczPn9NjWx61w4/u98iMOhx/+iKI46+h+QbKuGYJyFMh7FiYOz3hFPVj1GBhYkQ==
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr35351431ejm.37.1634638854515; 
 Tue, 19 Oct 2021 03:20:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id di4sm11154000edb.34.2021.10.19.03.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 03:20:54 -0700 (PDT)
Message-ID: <164d5ec6-b29a-eb8a-9bce-3b690039522e@redhat.com>
Date: Tue, 19 Oct 2021 12:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] po: update turkish translation
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?O=c4=9fuz_Ersen?=
 <oguzersen@protonmail.com>
References: <lDpmNUjNrVETJ2QoHoYmSoRvKoEIVFbF4IZAa1R5PVzqPCTh7nmV_ERHQlgYtNJN1Ppagtvelbo4uhSihEd5bSqIxCvGQchEWVpP-ofn2kw=@protonmail.com>
 <57904976-7779-7519-f1e4-f7e800c1145f@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <57904976-7779-7519-f1e4-f7e800c1145f@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 17:26, Laurent Vivier wrote:
> Le 15/08/2021 à 22:24, Oğuz Ersen a écrit :
>> Hi, this is a small patch to update Turkish translation, thanks.
>>
> Please don't send patch as an attachment, use "git send-email" or "git publish" if you can.
> 
> https://wiki.qemu.org/Contribute/SubmitAPatch#Do_not_send_as_an_attachment
> 
> With the help of Google Translate:
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> There is a typo that can be fixed during merge:
> 
>>   msgid "_Copy"
>> -msgstr ""
>> +msgstr "K_opyala"
> 
> s/K_opyala/_Kopyala/

This was intentional, because "K" was already used by the translation 
for "Show Tabs" ("Se_kmeleri Göster").  However, it is possible to keep 
"_Kopyala" if you modify "Show Tabs" instead:

diff --git a/po/tr.po b/po/tr.po
index 2845f3779c..f4f0425c43 100644
--- a/po/tr.po
+++ b/po/tr.po
@@ -61,7 +61,7 @@ msgid "_Grab Input"
  msgstr "Girdiyi _Yakala"

  msgid "Show _Tabs"
-msgstr "Se_kmeleri Göster"
+msgstr "_Sekmeleri Göster"

  msgid "Detach Tab"
  msgstr "Sekmeyi Ayır"


Can you squash this in the commit in your trivial-patches branch?

Paolo


