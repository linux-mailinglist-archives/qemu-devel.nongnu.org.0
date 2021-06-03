Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D4399B58
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:16:49 +0200 (CEST)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohay-00007i-0G
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohZz-0007q5-FG
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohZw-0006ID-GX
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622704543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5/QVOVGz0Xad2g5V43ATbb5LclTUXww4V5olQXA0S4=;
 b=BzGAyCxzJY4juw3wRh0Cga2/SL/0rtJ2e7kZTgLmci71u1X1MMz+kZTLYtEMvQhKwkNF+g
 g+UBFIkbgIDEaReLiv9U9knKu+c0jfPwCPmH6LIVGB63O2V5q/Gcc1pi1eudOvW+GwuTBu
 l+o61OLUJRsf41eAl5hUibKtVSakb9I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-OklzktoHMimHIIXnLozjWw-1; Thu, 03 Jun 2021 03:15:42 -0400
X-MC-Unique: OklzktoHMimHIIXnLozjWw-1
Received: by mail-ej1-f71.google.com with SMTP id
 w1-20020a1709064a01b02903f1e4e947c9so157297eju.16
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E5/QVOVGz0Xad2g5V43ATbb5LclTUXww4V5olQXA0S4=;
 b=muTY3Rq1iyIjaBP+Pe+fTkXtLXiRCxsqVo9RMWpQVNlipKaGhBkzTeGf6QUoDH+Adj
 6bIsgQJ3GJW/KW+dUMWpS14gGomEP6oJHtOHMh/2RxAbBgZQ8ekoYcXiL1qroO2TKgf1
 ODfozlez0oVE64XttiorL9uQE9y8IL+EoqSxnZQvpkUr2ClzJuSLD2dpTU05UZQQJalR
 FLtqdijMX25Ms3KsDz2lW5joCIUAQwbBRkILqtgqmvpYbS/AwnaQuUo7Vq/XlJTIccEy
 YqtGvV5mXoaZgO1yNYEpXzIkn6Xw7YC5hExjpiWxTlONH3SQyzc8S4HfUPEaNPAulWCr
 QPDw==
X-Gm-Message-State: AOAM531utJreH0dlFrVXtfpyJg9g/AKkz1jPzv+SkHmK1xKg5eK2wzGi
 90L76g5vkq/MMmqPLI0La8HI5veCfusvX1rnDOJVuhHZWXNt/ZSqAJgGjiynrQakx0cGsiQlvO4
 vlI7oncWX0LWi7BM=
X-Received: by 2002:a17:906:24d8:: with SMTP id
 f24mr20405732ejb.188.1622704540788; 
 Thu, 03 Jun 2021 00:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5AUhSQH4Wf9Mn6CnbdbMguTAS6j3nQlSnkuYlL6R8vPr2eIK8jRy7X9B5j7yR16ngRmDbgw==
X-Received: by 2002:a17:906:24d8:: with SMTP id
 f24mr20405713ejb.188.1622704540571; 
 Thu, 03 Jun 2021 00:15:40 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id kx3sm1083286ejc.44.2021.06.03.00.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:15:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] Gitlab: Add issue templates
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603001129.1319515-1-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6026d3aa-467b-1552-ea7b-af13bc1ef13f@redhat.com>
Date: Thu, 3 Jun 2021 09:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603001129.1319515-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:11 AM, John Snow wrote:
> John Snow (2):
>   GitLab: Add "Bug" issue reporting template
>   GitLab: Add "Feature Request" issue template.
> 
>  .gitlab/issue_templates/bug.md             | 63 ++++++++++++++++++++++
>  .gitlab/issue_templates/feature_request.md | 32 +++++++++++
>  2 files changed, 95 insertions(+)

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


