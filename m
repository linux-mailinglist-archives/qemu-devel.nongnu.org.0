Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323863D0AB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 09:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ITY-0008F7-HC; Wed, 30 Nov 2022 03:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0ITW-0008Ee-AI
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:29:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0ITU-0007Pp-MX
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:29:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y16so6109595wrm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LUT9uKhMc/IqMViUfhmFh6zxJdqph/7Ol1Mqq9U/75o=;
 b=fXlCFAKlR4lw1Pz0CsQUEQTKbfvrrR/7YQkOW+mQAHFhGnp+E+4c3dk9Zhg2V+XANy
 wv2VH6rSPnKbVkqNYFL18C8k7jarUVEysVZQGCLCpLkrxU8egBJAGgNU5cLNV28TGh1H
 wmhAi8p29JxN8CjVm9DFG6uAyVvwzdURQZhw5JteOfzJQYKBZWnPgMgrCfwYXcx+1Dlx
 U/vex4nPVLmmrfyM0o61/WHJZZq8C5dYJuZ/WGNOeSQcr67weD0PB9UYtG9LqM5lOKCv
 CTDQcQakg1kpcbljSfkM5EbIbv0TU1FHokAe7Z8K/EczeMq8peEbjuPAKGaYWiLVe4FT
 N+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUT9uKhMc/IqMViUfhmFh6zxJdqph/7Ol1Mqq9U/75o=;
 b=UuzeMaFXQxzkmF2/+9JMA1Di5/vrpk1bZWcflawpjKMEmK3Jv2FIwwrQ+qoDd96U3X
 EUnTQTeMsalbqNHMIcBlGjVmLPtS5OatJK/XDTKI9rw58XF1OqQZ56RV8BdQj0+dk1YQ
 18IyYTr+/vU+AuAn4j8LQSzpxA7AAKIE4MgtrykwpT9HyCvidPpnbeLTLadMJOUSlLPS
 00gG4Xrm1qGBx/5L0Fbto85G41e6b6DlL6HSmRiGncnr/DEeHQNjKn8V3T1Yl0oD+k3B
 7rlVy2WWAqi6GL/7H/xLUkJbOO1cmR3xKs3c6KhdPaP/7WlW8Yk3Xcx0IIh5esPwluVF
 a2Cw==
X-Gm-Message-State: ANoB5pkbZ0CxCRLHBorAre/NfkcgmbJycokhD2vHFhzFx/Q3P0vYkPSu
 zTNIX5mdWbMUToKWAS65PFsLSw==
X-Google-Smtp-Source: AA0mqf5rqE7UmQObc/JQXIYaoae376eB/3d2Hz17yvoVBzLC8DKLuT43KoKOCANsHBCG827o0AVkJw==
X-Received: by 2002:a5d:614b:0:b0:242:18a0:d03 with SMTP id
 y11-20020a5d614b000000b0024218a00d03mr8017777wrt.542.1669796985910; 
 Wed, 30 Nov 2022 00:29:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v5-20020adfebc5000000b00241c6729c2bsm840723wrn.26.2022.11.30.00.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 00:29:45 -0800 (PST)
Message-ID: <d6fc6751-1fe2-78de-49f5-2a34554767af@linaro.org>
Date: Wed, 30 Nov 2022 09:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 1/1] Fix some typos
Content-Language: en-US
To: Dongdong Zhang <zhangdongdong@eswincomputing.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/11/22 02:53, Dongdong Zhang wrote:
> Fix some typos in 'python' directory.
> 
> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   python/qemu/machine/console_socket.py | 2 +-
>   python/qemu/machine/qtest.py          | 2 +-
>   python/qemu/qmp/protocol.py           | 2 +-
>   python/qemu/qmp/qmp_tui.py            | 6 +++---
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machine/console_socket.py
> index 8c4ff598ad..4e28ba9bb2 100644
> --- a/python/qemu/machine/console_socket.py
> +++ b/python/qemu/machine/console_socket.py
> @@ -68,7 +68,7 @@ def _thread_start(self) -> threading.Thread:
>           """Kick off a thread to drain the socket."""
>           # Configure socket to not block and timeout.
>           # This allows our drain thread to not block
> -        # on recieve and exit smoothly.
> +        # on receive and exit smoothly.
>           socket.socket.setblocking(self, False)
>           socket.socket.settimeout(self, 1)
>           drain_thread = threading.Thread(target=self._drain_fn)
> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> index 1a1fc6c9b0..906bd13298 100644
> --- a/python/qemu/machine/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -42,7 +42,7 @@ class QEMUQtestProtocol:
>       :raise socket.error: on socket connection errors
>   
>       .. note::
> -       No conection is estabalished by __init__(), this is done
> +       No connection is estabalished by __init__(), this is done
>          by the connect() or accept() methods.
>       """
>       def __init__(self, address: SocketAddrT,
> diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
> index 6ea86650ad..15909b7dba 100644
> --- a/python/qemu/qmp/protocol.py
> +++ b/python/qemu/qmp/protocol.py
> @@ -812,7 +812,7 @@ def _done(task: Optional['asyncio.Future[Any]']) -> bool:
>   
>       @bottom_half
>       async def _bh_close_stream(self, error_pathway: bool = False) -> None:
> -        # NB: Closing the writer also implcitly closes the reader.
> +        # NB: Closing the writer also implicitly closes the reader.
>           if not self._writer:
>               return
>   
> diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
> index ce239d8979..8369144723 100644
> --- a/python/qemu/qmp/qmp_tui.py
> +++ b/python/qemu/qmp/qmp_tui.py
> @@ -71,7 +71,7 @@ def format_json(msg: str) -> str:
>       due to an decoding error then a simple string manipulation is done to
>       achieve a single line JSON string.
>   
> -    Converting into single line is more asthetically pleasing when looking
> +    Converting into single line is more aesthetically pleasing when looking
>       along with error messages.
>   
>       Eg:
> @@ -91,7 +91,7 @@ def format_json(msg: str) -> str:
>   
>           [1, true, 3]: QMP message is not a JSON object.
>   
> -    The single line mode is more asthetically pleasing.
> +    The single line mode is more aesthetically pleasing.
>   
>       :param msg:
>           The message to formatted into single line.
> @@ -498,7 +498,7 @@ def __init__(self, parent: App) -> None:
>   class HistoryBox(urwid.ListBox):
>       """
>       This widget is modelled using the ListBox widget, contains the list of
> -    all messages both QMP messages and log messsages to be shown in the TUI.
> +    all messages both QMP messages and log messages to be shown in the TUI.
>   
>       The messages are urwid.Text widgets. On every append of a message, the
>       focus is shifted to the last appended message.


