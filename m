Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BC232BA05
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:51:58 +0100 (CET)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWbF-00045l-Lc
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWZw-0002Gp-CZ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWZu-0000Tf-QV
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/WdutLgVHQ1y7NBDOx23pY7zg2Ny/+VXN3wOGWbDpw=;
 b=WdVdXd9Fs4MTuxIsiatV/cMTVA6BvUI/x5wudQ9Urz1jZXCLbXq+PuomIZWmTEFE6sEWJA
 8YEkt83vcySg804XP2qS250s4yoovHAIRI+RAOcmSTVbMNg3nHW0RnHndnYg1P49aljoaO
 +2N9tj2N9EfoAxHGHM0ciJWrCH9/tqA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-lTb-cDwrNA-WLSzXc_B2qg-1; Wed, 03 Mar 2021 13:50:32 -0500
X-MC-Unique: lTb-cDwrNA-WLSzXc_B2qg-1
Received: by mail-wr1-f72.google.com with SMTP id z6so4473255wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X/WdutLgVHQ1y7NBDOx23pY7zg2Ny/+VXN3wOGWbDpw=;
 b=ZYUgpVCGq7FL/45Wwc6UGV/jfakk91Pw7SfjOjgwJbTflNCICKkmij7NTU1ClzEZuk
 jTcD/ap2exUOITHiZLvXB6KluIcMXTEcH0n2TWOrghxTNRXJOZMsSn0hR6beBn1iZMys
 Z0p2h4N9LFdL0JLTetekkmDRt+LdS22RLmZk4XFhJWZ7dNcq1RZgpgUablVeYvWhG5TK
 KDtBP0zgNQyo70FWCmIS25FpxJDEWkHJ5cQkxlk9S3Vof2BESCzIUeBRxoHep4FqLQZX
 jFXohqlJ7A8eN90gWhaMHO/dJzLfkhtSYDdJbmXlhWohg43GUx16ifoZEGkLafKRHvjT
 mPwQ==
X-Gm-Message-State: AOAM531jaaMAroCWWHQ+YwrpWcX24tVGYGzhK0a59GNAU5rnAjYRvFJl
 UTexnKxHjK0/LAOEjUG2Btg1HmfTQgnM0KYX3Oqge2i5QNYtIec20y4MLnhAOlJufgVavBoehMh
 vrhiYrlDIBFWuRvc=
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr9619wri.237.1614797431182; 
 Wed, 03 Mar 2021 10:50:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH4C+ESum5RKg2KMmmaVmTPJ964dlopBuYhjKMLvrpi83LsXrBOEd7HxYquyoWUPpO8QbHMQ==
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr9595wri.237.1614797431017; 
 Wed, 03 Mar 2021 10:50:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g9sm6614109wmq.25.2021.03.03.10.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:50:30 -0800 (PST)
Subject: Re: [PATCH v2 4/8] scripts/device-crash-test: Replace the word
 'whitelist'
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-5-philmd@redhat.com> <87zgzkh25p.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fa4e927d-caaf-61f8-c5b1-ccfd5cf2b234@redhat.com>
Date: Wed, 3 Mar 2021 19:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zgzkh25p.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:06 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Follow the inclusive terminology from the "Conscious Language in your
>> Open Source Projects" guidelines [*] and replace the word "whitelist"
>> appropriately.
>>
>> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  scripts/device-crash-test | 30 +++++++++++++++---------------
>>  1 file changed, 15 insertions(+), 15 deletions(-)

>>  def whitelistTestCaseMatch(wl, t):
>> -    """Check if a test case specification can match a whitelist entry
>> +    """Check if a test case specification can match a allowlist entry
> 
> Seems like the function names (and params?) could be updated as well.

Eduardo already fixed/merged this one :)
See 1a14d4e16af ("device-crash-test: Remove problematic language")


