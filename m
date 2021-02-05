Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC23310DDC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:27:53 +0100 (CET)
Received: from localhost ([::1]:54334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83xY-0001Rf-Mq
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83uF-0007BO-Sk
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83uD-0005MC-0T
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsue6JF9HVocjj+xpL89RCRETrTMM1qM0FwcaCMDOk0=;
 b=aDNVYtwLVkvsVQHuWRgK7yTMfg2TbiKhwlxSIzRg5yb7kyA+2azd+I31vLCJXdpM9mNX+x
 +A4T8sgmRLJinrsjLjB5UPICWPS1Emb1nNBAUDXvHnYsqr49LI1F3PErEKmcccCzaGuQpV
 UgkhRG25UJi4BwYpZ0wks9tIV4C0+AY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-jqNV9TJVO8GRmePq8y2kAA-1; Fri, 05 Feb 2021 11:24:23 -0500
X-MC-Unique: jqNV9TJVO8GRmePq8y2kAA-1
Received: by mail-ed1-f72.google.com with SMTP id u19so7280189edr.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gsue6JF9HVocjj+xpL89RCRETrTMM1qM0FwcaCMDOk0=;
 b=eoUtwAK8+editYaMYZuZIZqTKb7rUhGjZXbO7sxOeCNhAmqa+6LpgcDImJuDrZbZSm
 EdmHcyMV4aVQETKNjZFxoqJ01AEywtIAgjH0zo+407UHqv0V1VnyLfFSjWvAw6v/bU1y
 fENGQWnyTNf/oTQVoamNB44l1F3Bu0q5i4n1fvkTF+HaPivPeBCjFMYsIc1Q+yOtI+kN
 40pIh6e7RYm3N7LPx7jziwVt9127opz+G5O4i8DJdm6oQ/ggZT3nGf0CgEEurwECO1UU
 IeD+q1gcyvfx5RkNBIGQJYn3+zyCWnMkn3x4Np0dVzVncD0g8uFL4VJ0jTfwDU7V17Zd
 THkA==
X-Gm-Message-State: AOAM532/dB1fx8Vy9WWp04kPG1gZwgNLUWDTZ4DzmjrMsV8TzkY7o7zr
 7c4mQotO1dp5C+GueMJfoP090VM0mJKW9aKMihrz8cKJ8aVv1LrGl6JPPkCnE2yJ61ZQstFDgNP
 RRDIdnZE6LahRyZc=
X-Received: by 2002:a17:907:11c7:: with SMTP id
 va7mr4741713ejb.351.1612542261511; 
 Fri, 05 Feb 2021 08:24:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSZCz8Pvi5hYp+YO1uyjCzTqc3Ozg/hWRCxTVd/eesSQ260gveyQJEkx2lVln/asaQmkLl5w==
X-Received: by 2002:a17:907:11c7:: with SMTP id
 va7mr4741690ejb.351.1612542261323; 
 Fri, 05 Feb 2021 08:24:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kv24sm3918838ejc.117.2021.02.05.08.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:24:20 -0800 (PST)
Subject: Re: [PATCH 14/33] migration: push Error **errp into
 loadvm_postcopy_ram_handle_discard()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-15-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a5b323d7-562a-594d-e981-ce8618935954@redhat.com>
Date: Fri, 5 Feb 2021 17:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-15-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
>  migration/savevm.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index fa7883ae5e..2216c61c6f 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1735,7 +1735,8 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
>   * There can be 0..many of these messages, each encoding multiple pages.
>   */
>  static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
> -                                              uint16_t len)
> +                                              uint16_t len,
> +                                              Error **errp)
>  {
>      int tmp;
>      char ramid[256];
> @@ -1748,7 +1749,8 @@ static int loadvm_postcopy_ram_handle_discard(MigrationIncomingState *mis,
>          /* 1st discard */
>          tmp = postcopy_ram_prepare_discard(mis);
>          if (tmp) {
> -            return tmp;
> +            error_setg(errp, "Failed to prepare for RAM discard: %d", tmp);

New error, OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +            return -1;
>          }


