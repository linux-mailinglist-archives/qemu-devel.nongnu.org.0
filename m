Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4E2F5F7C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:07:43 +0100 (CET)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00Tf-00011c-09
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00S9-0008PD-Hq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:06:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00S8-0005er-0g
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610622367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6y8dH8O8Lm1A14GjMrjTi53NEpSF5rAhFkXe1vpoACI=;
 b=NqVLh44HLdoHd5WMOqnPKfLcl8cKR7oZo3sqMmYFtUWKp7UgQ3hF4zZhZm1EJI/BRH1PiP
 msE6KMPNKXbwt+/kJYHliogZ+XeeAtumIpzRiRg7G50NPeNC/O5Vd/7XS35wDHsKYiXa5x
 Z1PCkOk++A+HX5/8GOzI0o8lJN0LyyI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-jpxmzsHuNBecYta7rlqKzw-1; Thu, 14 Jan 2021 06:06:05 -0500
X-MC-Unique: jpxmzsHuNBecYta7rlqKzw-1
Received: by mail-wr1-f72.google.com with SMTP id j5so2440850wro.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6y8dH8O8Lm1A14GjMrjTi53NEpSF5rAhFkXe1vpoACI=;
 b=tD54Xz9MitSZR8zNxiftx2yyWZWnlgVKvolNSkf5/qZctxx1ROMEU18CpCTEg9yzN4
 vb0kxRGkJ/Ui2B1iSrOhucjx0FTHy3qwEusQu3so65emEo1Brrd2NhDu9GZm9QapTliO
 psSeuLxLeBfHqxyJb0DbXkRsxTXhdEAGcMJxhtTaqipjZ/SrVRFwHOxeuw6nqt8WgpYv
 uGPeAGEsGrhyUvf7t3SBew3pRKwFqDHFUOkJ5MtEws6bNkTHKn3KBXfI+9hY0GEak+kC
 a2uEEIXX3E3as8oN2vIlEJKUU3MIbMlYNM+CJrGOTYKGjXFG3MeKUh4juflhia0+u0de
 18eg==
X-Gm-Message-State: AOAM532ZRDlHTgJ64MEjHGbNMknJMMYeDr1Qqs3EF4MkAfq0LRNP7+hx
 lOW71Q1neYCVNbePfJ07rOmYD4i4Cf5KkmCQKCercv6cxJoljV8X9vlofjxUrb/HgwWcr5CBr2q
 mLyjo5KWPhWLMNBQ=
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr3450877wmj.168.1610622364523; 
 Thu, 14 Jan 2021 03:06:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKAqTdNxsjKbO1JlxY458PtKOF1RalvEr3moJsZ13TREUrEsWqKLEJcb3JAxbxIZVYyUJ7TQ==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr3450860wmj.168.1610622364243; 
 Thu, 14 Jan 2021 03:06:04 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a62sm7201680wmf.7.2021.01.14.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:06:03 -0800 (PST)
Subject: Re: [PATCH] utils/fifo8: change fatal errors from abort() to assert()
To: Claudio Fontana <cfontana@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210114083329.10494-1-mark.cave-ayland@ilande.co.uk>
 <c1190557-8959-3c41-ae53-72504243f109@suse.de>
 <ec32506f-ec83-d166-f444-efa33e2867e9@ilande.co.uk>
 <10945f87-a43b-98c5-6f53-1042b3eb1311@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1e4b9f3f-342c-6e4b-65a0-00d3ffca35b8@redhat.com>
Date: Thu, 14 Jan 2021 12:06:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <10945f87-a43b-98c5-6f53-1042b3eb1311@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 11:15 AM, Claudio Fontana wrote:
> On 1/14/21 10:58 AM, Mark Cave-Ayland wrote:
>> On 14/01/2021 09:07, Claudio Fontana wrote:
>>
>>> On 1/14/21 9:33 AM, Mark Cave-Ayland wrote:
>>>> Developer errors are better represented with assert() rather than abort().
>>>
>>> ... "also, make the tests more strict"
>>>
>>> I'd add this since the checks have been changed sometimes in the patch to be more strict.
>>>
>>> Reviewed-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


