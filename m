Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08975BD478
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:07:28 +0200 (CEST)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLB2-0000hL-2v
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaKk8-0008Cb-8u
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaKk4-0003em-To
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663609175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzRGfGqCYvfKxqEy+ejKNMk11nWbd3TuE6b4Rxd1uFg=;
 b=hFiRtUSqZhoAozyIhhdhlIQLkHoZIERE8jsNZZoU25XXxlTKJ7ybkIWG2utAa11ywVZIpQ
 yKc56myOugxC6tSN7C4sVZET0iWkiiVTR3OMLycD9huajP83oCNfW6qhxowwbI85YbF+0g
 gNIWnlOUD1oYz2Y40P7UCLPKwy2CvdA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-urX8fgX5NYieazwDoWa0Ig-1; Mon, 19 Sep 2022 13:39:29 -0400
X-MC-Unique: urX8fgX5NYieazwDoWa0Ig-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso79588edc.21
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HzRGfGqCYvfKxqEy+ejKNMk11nWbd3TuE6b4Rxd1uFg=;
 b=wEaDZUA6ZmUv3OgNyyrUGablf0yQzM4kyDsuO/9ywmqSPWELnnd3INIR4/zsZ4RGtr
 jFx479dwILoKBf9tZ/Ubd1lN8Y53HaAYxVyEX7DfyUTbtH1kvR+z278tsYX1R/Duvvd+
 gwpu9H9MaTHF+HkeD4ekQsi2WxBNult8RJgac4OesHb6k/aEF8iUyzq0CMhMVasBQDUL
 j+XLcNB8b7dt6k2aSDvEq5hcWFcu3324mGLt7gkqXAoiIMBpzcUQmPaEMk6hVBbMtPdM
 1d52ibF9X6DGXIwLhQ+iIC47cFYYcS/UXdZRyLK7+YqpT6T/mj9WYFehzlKEGeLpK/2t
 VPmg==
X-Gm-Message-State: ACrzQf3qivbNRwiXC0kB35jWQ+Idqi0Ry1DQz/50pQpdcPwxoWiAln7p
 K2V8p2qDcuJOB/FfbtQesZfYg6qpsgE/3Alv4PonfkK8dzNlnkg87fk66Xqx/HKAVyC4EOoo3YV
 bAbEScsTAq6lRmeU=
X-Received: by 2002:a05:6402:26d2:b0:451:5a8c:346b with SMTP id
 x18-20020a05640226d200b004515a8c346bmr16194831edd.424.1663609168607; 
 Mon, 19 Sep 2022 10:39:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4TnmNRw2I0dyn0Mx3SV0EyodjD+Cjtza5R0rJiRk9yaqhTpnzOne2F8yeQtr7mV+nCmbAAeg==
X-Received: by 2002:a05:6402:26d2:b0:451:5a8c:346b with SMTP id
 x18-20020a05640226d200b004515a8c346bmr16194826edd.424.1663609168483; 
 Mon, 19 Sep 2022 10:39:28 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 t12-20020a1709063e4c00b00741383c1c5bsm15940451eji.196.2022.09.19.10.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 10:39:28 -0700 (PDT)
Message-ID: <153a48b2-56ad-6b8f-2150-ba0aacd50079@redhat.com>
Date: Mon, 19 Sep 2022 19:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Travis CI webhook returns HTTP 500
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <CAJSP0QWjRH+ZWOQUu2_283o3YmcQp0iVTr6bT0Rqvv=Y0YFNdg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QWjRH+ZWOQUu2_283o3YmcQp0iVTr6bT0Rqvv=Y0YFNdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/09/2022 19.04, Stefan Hajnoczi wrote:
> GitLab sends qemu.git push event webhooks to Travis CI. Recently the
> webhooks have been failing with HTTP 500 Internal Server Error.
> 
> Do you know how to resolve this or who configured Travis CI webhooks for QEMU?

I haven't been involved in this, but IIRC Paolo set up the Travis CI for QEMU?

  Thomas


