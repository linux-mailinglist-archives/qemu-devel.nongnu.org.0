Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A466CE74
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 19:12:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTwJ-00033V-1g; Mon, 16 Jan 2023 13:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTwF-000311-Iy; Mon, 16 Jan 2023 13:10:31 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTwD-00034s-JX; Mon, 16 Jan 2023 13:10:31 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhDIw-1on4rz3KDq-00ePZR; Mon, 16 Jan 2023 19:10:17 +0100
Message-ID: <a117f627-a043-4801-db65-114b0b0cc0a6@vivier.eu>
Date: Mon, 16 Jan 2023 19:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/1] Fix some typos
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Dongdong Zhang <zhangdongdong@eswincomputing.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
 <d6fc6751-1fe2-78de-49f5-2a34554767af@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <d6fc6751-1fe2-78de-49f5-2a34554767af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EhjKJl+//Rx5KWpU6h1soI6IILQgavQVskr9lys7JR22T4ZGtQp
 Z7kTj6GKWZetRmAXKF43z/aXAFyZtDd0k8gnq6pvcONSDgl4S9/EZU7vlCzSddKlFrcRABY
 bw+iqc2uPQzbFGKg/JV1+2tWDZjE6kdsA77OQtm2g5sNV1ukadGWCLNPrhjX6mIQfk3sUph
 MnIysRbhQiY5wn88VZSHQ==
UI-OutboundReport: notjunk:1;M01:P0:12nWvpCGJHI=;qUsU5fytm1L8cbRj/saihQKaAeS
 reRV22uvOw498bFIhEwd9mBvea6nyCnjdhciMnumemUG54J86qZg7OsxSjLzjOJbBNN5GUgVF
 xbenKnId8Ct4XJDcUI0Pvo8r1PVM4+l4QKhsF+KtdVBPxvY3Ftl/fC+wGYGJ2v2USSPSOSo8h
 NKLcDjFtt0b2KrCGr9iKo9yW/3FOi6rdRHKiWXax8oF0Zk9WyIkhwRE8eLkipkJANCFnt6Hiy
 4r0hjVa2EgdSPHP/XuPtXejUAGywPD+N1YFrPpudwdKUnMsJ/0kMM1fBj0lbNxbeQ9qqvbZ5P
 CuYP76Dhi4+fkXcx+YU68ZF43hXB9ID/5wxd2YS3Ojo3SynpqYKv4EUmN2ZpUKqoT1Oj4hYxq
 ALOByMqURdcoaMQkNnwV7U0jbKdpPcNf90N7DBjbdL2kwdzETXt/ooK3bNqg5vKJ1SBbluz0D
 FPnNWmFyW5Dge1LRNdd3HqWh7lMZvVoTmjinwPIhQGaTnGAOvLKIEYLeMLNmJmjjDvqZW81oM
 4R4MTTSKu6lVkU2nlG9XeJgv7yPCLCyW0IBx0EsYG5eF9XAtGsNvcDJjqUEt2Y9qKIsQNsjOe
 i8d4Zq42tym+hwnJdBQ19kMYNoGcWOnHSPrTVISZLY30dEKR3/wjWNvtkhIaeuaMCR89W/PyC
 J8TeHHCTdAbMKsIDGVt66ntGxrVfR7OCIjLlKA4NcA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 30/11/2022 à 09:29, Philippe Mathieu-Daudé a écrit :
> On 30/11/22 02:53, Dongdong Zhang wrote:
>> Fix some typos in 'python' directory.
>>
>> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> ---
>>   python/qemu/machine/console_socket.py | 2 +-
>>   python/qemu/machine/qtest.py          | 2 +-
>>   python/qemu/qmp/protocol.py           | 2 +-
>>   python/qemu/qmp/qmp_tui.py            | 6 +++---
>>   4 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machine/console_socket.py
>> index 8c4ff598ad..4e28ba9bb2 100644
>> --- a/python/qemu/machine/console_socket.py
>> +++ b/python/qemu/machine/console_socket.py
>> @@ -68,7 +68,7 @@ def _thread_start(self) -> threading.Thread:
>>           """Kick off a thread to drain the socket."""
>>           # Configure socket to not block and timeout.
>>           # This allows our drain thread to not block
>> -        # on recieve and exit smoothly.
>> +        # on receive and exit smoothly.
>>           socket.socket.setblocking(self, False)
>>           socket.socket.settimeout(self, 1)
>>           drain_thread = threading.Thread(target=self._drain_fn)
>> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
>> index 1a1fc6c9b0..906bd13298 100644
>> --- a/python/qemu/machine/qtest.py
>> +++ b/python/qemu/machine/qtest.py
>> @@ -42,7 +42,7 @@ class QEMUQtestProtocol:
>>       :raise socket.error: on socket connection errors
>>       .. note::
>> -       No conection is estabalished by __init__(), this is done
>> +       No connection is estabalished by __init__(), this is done
>>          by the connect() or accept() methods.
>>       """
>>       def __init__(self, address: SocketAddrT,
>> diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
>> index 6ea86650ad..15909b7dba 100644
>> --- a/python/qemu/qmp/protocol.py
>> +++ b/python/qemu/qmp/protocol.py
>> @@ -812,7 +812,7 @@ def _done(task: Optional['asyncio.Future[Any]']) -> bool:
>>       @bottom_half
>>       async def _bh_close_stream(self, error_pathway: bool = False) -> None:
>> -        # NB: Closing the writer also implcitly closes the reader.
>> +        # NB: Closing the writer also implicitly closes the reader.
>>           if not self._writer:
>>               return
>> diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
>> index ce239d8979..8369144723 100644
>> --- a/python/qemu/qmp/qmp_tui.py
>> +++ b/python/qemu/qmp/qmp_tui.py
>> @@ -71,7 +71,7 @@ def format_json(msg: str) -> str:
>>       due to an decoding error then a simple string manipulation is done to
>>       achieve a single line JSON string.
>> -    Converting into single line is more asthetically pleasing when looking
>> +    Converting into single line is more aesthetically pleasing when looking
>>       along with error messages.
>>       Eg:
>> @@ -91,7 +91,7 @@ def format_json(msg: str) -> str:
>>           [1, true, 3]: QMP message is not a JSON object.
>> -    The single line mode is more asthetically pleasing.
>> +    The single line mode is more aesthetically pleasing.
>>       :param msg:
>>           The message to formatted into single line.
>> @@ -498,7 +498,7 @@ def __init__(self, parent: App) -> None:
>>   class HistoryBox(urwid.ListBox):
>>       """
>>       This widget is modelled using the ListBox widget, contains the list of
>> -    all messages both QMP messages and log messsages to be shown in the TUI.
>> +    all messages both QMP messages and log messages to be shown in the TUI.
>>       The messages are urwid.Text widgets. On every append of a message, the
>>       focus is shifted to the last appended message.
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent




