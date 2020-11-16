Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B0E2B43E2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:43:55 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedrP-0007rq-0p
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedpF-0006yY-Ma
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedpD-0000rU-66
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605530498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUO9w3vLIqtgbXgx3q9+EyWWa6luh0IzaagnftT+Rj0=;
 b=a6ViNudBblB9qxZcBAW1O2cLn42cyD9zkPIH7QTXKUoMc59DKqPT1qI4YEIewr/lUorGd3
 S6eniggPSQYxPK1wYdemBo6Zoc+IJtXzNdgpzcWtXxIudLM1R/Nq7yLf4Fsn/4ASfLujxL
 jF0cgGHvbyC7+ZlFMNcd5wMZnFMBAxE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-pyq4yDlANi6juc01daEZag-1; Mon, 16 Nov 2020 07:41:37 -0500
X-MC-Unique: pyq4yDlANi6juc01daEZag-1
Received: by mail-wr1-f71.google.com with SMTP id w17so10918489wrp.11
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:41:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DUO9w3vLIqtgbXgx3q9+EyWWa6luh0IzaagnftT+Rj0=;
 b=SMlHVVY2SjPFRVrh95hpreo+Kmedx6mrB39eFY2zBZXCUZbfYL/OqTKHoNhDRrx7PO
 g2U/uNzxdedtbCxlXR9RAxoFcmz8T+huFLNaMsxHSoyuFPFG+rzf7sN9i7MyITJNQbv9
 9dJ6BPx6pJV0NqDbeKyGWF5/jcM8f3jzFHgVNGriPis3cefZ3oVlEzojIQrvte6Dwjmv
 9CDmOtMOh7yek0Ous0pX/BscMbj3+RdvypfbMVf6vEXGC9WGsIUeyp4Z3eY7XFJC7zNq
 27QmQTx2sCN9hQyQFB8Eu2/F3NnaeBeXE7DWzLsUeCas3svkMl+PijFk4Px6j6CSQRmP
 Kvrw==
X-Gm-Message-State: AOAM5336rzkpA/fkOXiN8bXXXN7g/8N4zuoCpC4oxkNwhfOFs7D1tHj+
 JtbIRp7WjvJXRlU+sWSNjN6Ed2UkUQVImNzUNOV/GG94Rwk2npGhqWnRdLipTXQ/KuCSUw1b4AE
 mdvA1tumWo7nllZqCVd7uhEki8nx4jGn1G7sThSYyEZSCPZ3pRS5zGqNAV//OQpy6
X-Received: by 2002:adf:f4c7:: with SMTP id h7mr18495313wrp.234.1605530495721; 
 Mon, 16 Nov 2020 04:41:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykbGZpqv92fau0BtwDb61bOAd9IJivkN2Xn41mYXyU/FUDqc+pAD1oZyhQ7eVbYFen5+W5FA==
X-Received: by 2002:adf:f4c7:: with SMTP id h7mr18495298wrp.234.1605530495576; 
 Mon, 16 Nov 2020 04:41:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t11sm16325839wrm.8.2020.11.16.04.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:41:34 -0800 (PST)
Subject: Re: [PATCH 01/10] qerror: Drop unused QERR_ macros
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201113082626.2725812-1-armbru@redhat.com>
 <20201113082626.2725812-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22e42e2b-c6fc-9809-f392-2357bfd71e5f@redhat.com>
Date: Mon, 16 Nov 2020 13:41:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113082626.2725812-2-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 11/13/20 9:26 AM, Markus Armbruster wrote:
> QERR_INVALID_BLOCK_FORMAT is dead since commit e6641719fe "block:
> Always pass NULL as drv for bdrv_open()", 2015-09-14.
> 
> QERR_INVALID_PASSWORD is dead since commit c01c214b69 "block: remove
> all encryption handling APIs", 2017-07-11.
> 
> Bury them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/qerror.h | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


