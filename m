Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A884E3BDE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:45:35 +0100 (CET)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWb51-0002ir-0K
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:45:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWb2S-0000d9-PN
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:42:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWb2R-0007a5-A4
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBalT44IyQgp9oZD8WYoSoXIOJfx+q3T6wI2TGnYn+g=;
 b=NQ/3bYYUca98SiedtQUBxRgBLCv7tyZjw4+zaJ2c0GEafvh9ZheQrr5t1VbzS9Sfaw1DoF
 U9Ezt4FsmZyC2vazmdJ5LfJCsGJmuFQ860AvhnZLS1qeA9BfyZx65OQRVB8p73rBHqgfr5
 qwdxhGd21RQiFzw1tM0/ou66SWoCJCI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-iirj8yCZNCOEwT2N4tF1Sg-1; Tue, 22 Mar 2022 05:42:49 -0400
X-MC-Unique: iirj8yCZNCOEwT2N4tF1Sg-1
Received: by mail-ej1-f70.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso8410705ejj.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DBalT44IyQgp9oZD8WYoSoXIOJfx+q3T6wI2TGnYn+g=;
 b=iNI/HtCFL2fFtvzU6f2/W1OMxoyi/qkTwXF766QdhYJ89XQkYT7cGGNx46iKK6SLlI
 D3pCvbaHV2tYNms5dO3OmsWWsjLjKXBdq9ImtcU/VGJYLnFIvB/+KupBKhuHxVbsCbA0
 KbyVBNn+VePibPh3V9dEqcLOgrs9s4HMIiJcsGnhmS2uRo8filBUWVD24AaQ005mbITz
 29dQtSZ8BGekiD9x4M27Jf1c4ugs2fugs4+yOKJUyMMLN3mhKANs7k5b+TAQJMthcTKn
 C3t9VAomGJ6IoIahdI5xJ+1I1aVyOoQWT5xht036Q9EhMIi33lix3S33CxsjmfOv1jRZ
 /M5Q==
X-Gm-Message-State: AOAM5318YFWj+gcbtGfnu6jsVsyijAdwAXa8vw3bDSLmN7Zv/Q5pRDUu
 wgTsTopAs58/Jysmj/4X/pHYZ/7Vhx0V9QFKTsDIMfEp0mLmDk/ylUbIiCeSkH6RFU6uU51weuv
 kyuau0xpDvYjYiIc=
X-Received: by 2002:a17:907:2d90:b0:6d8:9fc9:ac36 with SMTP id
 gt16-20020a1709072d9000b006d89fc9ac36mr25378702ejc.28.1647942168283; 
 Tue, 22 Mar 2022 02:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd7Cj55K5fGIqK1/6jC13rjmnzorDNmRXGr1HDhf5JZAVyDt7Blvm7VBdY1YL11HfwYtL5zQ==
X-Received: by 2002:a17:907:2d90:b0:6d8:9fc9:ac36 with SMTP id
 gt16-20020a1709072d9000b006d89fc9ac36mr25378679ejc.28.1647942168063; 
 Tue, 22 Mar 2022 02:42:48 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 a5-20020aa7cf05000000b0041919e52a38sm5166971edy.46.2022.03.22.02.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:42:47 -0700 (PDT)
Message-ID: <15d491a9-1e35-6dd2-ee7f-3f9a57d34ba1@redhat.com>
Date: Tue, 22 Mar 2022 10:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220321201618.903471-1-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.03.22 21:16, John Snow wrote:
> V5 hotfix:
>   - Quote the subprocess.CompletedProcess[str] type annotations,
>     Python 3.6 chokes on them at runtime :(
>   - Reduce line length in the text decoration fn,
>     even though check-patch still doesn't like it.
>   - Reflow docstring for qemu_img.*
>
> V5 CI: https://gitlab.com/jsnow/qemu/-/pipelines/496050668
>
> [*] Didn't re-run CI for this tiny change. If it breaks something I WILL
> cry.

Don’t worry, I won’t tell you.

Thanks for the quick fix!  I swapped v4 for this new version in my block 
branch.

Hanna


