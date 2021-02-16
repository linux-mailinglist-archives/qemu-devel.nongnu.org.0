Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797231D1DB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 22:10:09 +0100 (CET)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC7bk-00033o-EY
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 16:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC7aY-0002Do-5B
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:08:54 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC7aW-0001d2-Gq
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 16:08:53 -0500
Received: by mail-ed1-x532.google.com with SMTP id o3so11842165edv.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 13:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GUc/OvksHlWK2il8a9BmgzDHskU9MCN1TWImwBh6FU8=;
 b=a1wbRgEkVc6n8ZRNOxNJyHf/nA/xltqwg60YDyndu0MZwQ4DQP+1UI69aJn0Qopmtg
 WRDoAH0X5s6YTQ5CiOsEwOc0+oOXrKR0+4tN5SIP6Mm/Y6lNN9c9Ux+K8WqVODbZa5Tn
 ofe8ViVAwfL7lALWSgOyKd067iwQrIzrIdGFzdR/JihF+Nk5Art6VI+iJEehOAccR5tg
 gYemp0gY9ff9mK5N06ngOLK2t5nZC3GEBrNwQaRIDG8Hf99uKdHfwRezZ8KuiCyekDEc
 Hl8VHBeJNXqZGOTq08CgK6Q9cgTM25ji9RJMFC9fx8VcnwmgoVMcl7CneQX9742G7TKs
 GcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GUc/OvksHlWK2il8a9BmgzDHskU9MCN1TWImwBh6FU8=;
 b=hN3UoM2o5KgmUE7l+XUPdmnTDmdHYdangh1f52/r6nsIrBHodK0AFacLjPbCCZvwfn
 DpZ9aITUgWVyisjoJTGTMqhKNxiyilcd6dojAd1FGMiPsLSFP1BtcosnHSJqnkfFhEEr
 aJyJj/8Tw9eF9b9DaR2XovO1IEjDjiM6E40gzCxiMHHvnzAZkekBKDSL07Dy4A96l8Eg
 5MJIVEdchEP2pcqE1TxLXxWq8Vmf9W0Y5+miDpwwOAeObZkuFBNk2mtrmmaTdVAymdjM
 fV7WZvk1FvameIrOuDbQo0QTpaCAU5eI4L8SiEG0R8x3ZjMK4JUnrv/V801aT1pmLg8S
 njfw==
X-Gm-Message-State: AOAM5330dqS7/1ph+JsHUNr6CfTcWgGVngG6eXSTbo0379Qxx1ah2B0o
 Wmu7nbyA4BPMgXUgO3DIVeKxmPcKuOwNWqNKVWeETw==
X-Google-Smtp-Source: ABdhPJzNtSxMqJmA0KTPcp0ufsjaPI9ixCNqCtpZY6lLmBUg96P7EbwJiFTXDpaKSfWoDeqralfF6XqYNHyrZ/gzjP0=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr22539847edd.100.1613509730441; 
 Tue, 16 Feb 2021 13:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20210216191027.595031-1-berrange@redhat.com>
 <20210216191027.595031-3-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-3-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 21:08:39 +0000
Message-ID: <CAFEAcA8Pjz8SuzuZVKNGCmS-QkewD-0MLSu+coOOvG88jKJq5Q@mail.gmail.com>
Subject: Re: [PATCH 02/10] qemu-options: update to show preferred boolean
 syntax for -chardev
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 19:10, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The preferred syntax is to use "foo=3Don|off", rather than a bare
> "foo" or "nofoo".
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> -    "-chardev socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][=
,ipv6][,nodelay][,reconnect=3Dseconds]\n"
> -    "         [,server][,nowait][,telnet][,websocket][,reconnect=3Dsecon=
ds][,mux=3Don|off]\n"
> +    "-chardev socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4=
=3Don|off][,ipv6=3Don|off][,delay=3Don|off][,reconnect=3Dseconds]\n"

Watch out, 'nodelay' is a special case, where the option name itself
starts with 'no':

{ 'struct': 'ChardevSocket',
  'data': { 'addr': 'SocketAddressLegacy',
            '*tls-creds': 'str',
            '*tls-authz'  : 'str',
            '*server': 'bool',
            '*wait': 'bool',
            '*nodelay': 'bool',
            '*telnet': 'bool',
            '*tn3270': 'bool',
            '*websocket': 'bool',
            '*reconnect': 'int' },
  'base': 'ChardevCommon' }

(because it's setting the TCP_NODELAY option).

This probably applies elsewhere, eg I suspect the 'nodelay' in
patch 1 also should remain.

-- PMM

