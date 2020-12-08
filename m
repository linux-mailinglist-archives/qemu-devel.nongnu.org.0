Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA12D3446
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:51:52 +0100 (CET)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjxf-00026m-GQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmj7H-0003Cj-AD
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmj7F-0003kk-MU
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607457460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TpT0LhEVooLSsd/KPdQxXrDvUdeJl9QuKJYQoP1P+w=;
 b=EcO4BJ0qZCTvbyd/TTqq/CxkZkWAr/VXgDVuL7n3FdbUptw4tJKK4CnJOnsfAorMTcetA2
 tqeKAtojAciG03xnTNq1PlwkaOmeRpDqP1r5QixtIS3QpUFyblxjGwsXHw+Jz4sra9dg/T
 2S/p8kbEQiKCHI17vBF1Joh6oyhFGaU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-ZmvL-xAmP8ycZ02Idda45w-1; Tue, 08 Dec 2020 14:57:39 -0500
X-MC-Unique: ZmvL-xAmP8ycZ02Idda45w-1
Received: by mail-ed1-f70.google.com with SMTP id ca7so8028352edb.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3TpT0LhEVooLSsd/KPdQxXrDvUdeJl9QuKJYQoP1P+w=;
 b=oaLaobINHbxP52BZkwZBg2MI5T6AZfgqNMhKjKTxzOUNM3NqF18mJ8DH/NEo8LIsIz
 2ZMbRYcxwaEoE299cQ1m9aYCO+FBMzHoHKb7Nyps36W4cyOjHIMilzQcibfFuqi18GkY
 vKz10ufs3fK+I6rT2hyvTxrxFNWMHvV+GCDNOZD97L9fG+IB85vzDPgJa6BSYCUSGzAc
 3/Be2BLf5vsIcS+6oIQKfr2QUtQPFpOm3gWLDbjmtedoC2mGOFd22hNYPcO07dGaP+B8
 d6nyABvAh3h0sCrgbrhmGO/y6buvXnya63joR5Zyt4Qw24P3AN5Fg6PDxolE4VAIit0w
 9eRQ==
X-Gm-Message-State: AOAM531kUjIkW0t0jHJCnMTr9ezQTQ/Wz4jA/x2mdyNoALmRLurb6hQ5
 FWAEu0U0usFEc92yYuHxNAXGa++RTuNZwY1TDwTE8JYpeLm2gJKTgRiBlIAu8nZSLkql5C0uizF
 mgSoxZVFzF2hwDUGL10bEC+8zPvbrGZkm5Fx0biuPMaZ40VxnkiWTAJfIWlV4JYnfBo8=
X-Received: by 2002:a17:906:4b56:: with SMTP id
 j22mr14818380ejv.443.1607457457771; 
 Tue, 08 Dec 2020 11:57:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze+YLpgMX1ElfBZ4zgWulSqmSk+i9VzgLdgOqVv8vgYTeiapk9ScrNRaGiKiWtVKK9oSe+3g==
X-Received: by 2002:a17:906:4b56:: with SMTP id
 j22mr14818370ejv.443.1607457457512; 
 Tue, 08 Dec 2020 11:57:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n7sm18396858edb.34.2020.12.08.11.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:57:36 -0800 (PST)
Subject: Re: [PATCH 3/4] qmp: Allow setting -action parameters on the fly
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, qemu-devel@nongnu.org
References: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
 <1607454890-3339-4-git-send-email-alejandro.j.jimenez@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <98a0e686-5e3c-b9c3-6885-04cdaa54df60@redhat.com>
Date: Tue, 8 Dec 2020 20:57:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607454890-3339-4-git-send-email-alejandro.j.jimenez@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

On 08/12/20 20:14, Alejandro Jimenez wrote:
>   ##
> +# @reboot-set-action:
> +#
> +# Set reboot action
> +#
> +# Since: 6.0
> +##
> +{ 'command': 'reboot-set-action', 'data' : {'action': 'RebootAction'} }
> +
> +##
> +# @shutdown-set-action:
> +#
> +# Set shutdown action
> +#
> +# Since: 6.0
> +##
> +{ 'command': 'shutdown-set-action', 'data' : {'action': 'ShutdownAction'} }
> +
> +##
> +# @panic-set-action:
> +#
> +# Set panic action
> +#
> +# Since: 6.0
> +##
> +{ 'command': 'panic-set-action', 'data' : {'action': 'PanicAction'} }
> +
> +##

What about a single action-set command with arguments reboot, shutdown 
and panic?

Paolo


